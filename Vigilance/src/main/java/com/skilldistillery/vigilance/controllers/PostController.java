package com.skilldistillery.vigilance.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.NeighborhoodDAO;
import com.skilldistillery.vigilance.data.PostDAO;
import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.Comment;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.Post;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class PostController {

	@Autowired
	private PostDAO postDao;

	@Autowired
	private UserDAO userDao;

//	@Autowired
//	private NeighborhoodDAO hoodDao;

	@GetMapping("viewAllposts.do")
	public String viewAll(Model model) {
		model.addAttribute("post", postDao.allposts());

		return "/webpages/forms/viewAllPost";
	}

	@PostMapping("addPost.do")
	public ModelAndView addNewpost(String description, String photo, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Post newpost = null;
		User loggedInUser = (User) session.getAttribute("loggedinuser");
		
		try {
			int userId = loggedInUser.getId();
			int neighborhood = loggedInUser.getHousehold().getAddress().getNeighborhood().getId();
			newpost = postDao.createpost(description, photo, userId, neighborhood);
		} catch (RuntimeException e) {
			mv.setViewName("/webpages/failurePage");
			return mv;
		}
		if (newpost != null) {
			redir.addFlashAttribute("post", newpost);
			mv.setViewName("redirect:PostAdded.do");
			return mv;
		} else {
			mv.setViewName("/webpages/failurePage");
			return mv;
		}

	}

	@GetMapping("PostAdded.do")
	public ModelAndView addedNpost() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webpages/forms/viewPost");
		return mv;
	}

	@GetMapping("getPostById.do")
	public String getnpost(int id, Model model, HttpSession session) {

		Post post = postDao.findpostById(id);
		User loggedInUser = (User) session.getAttribute("loggedinuser");
		List<Comment> comments = postDao.viewComments(id);
		int likes = post.getLikes().size();
		if (post.getLikes().contains(loggedInUser)) {
			model.addAttribute("likes", likes);
			model.addAttribute("comments", comments);
			model.addAttribute("post", post);
			return "/webpages/forms/LikedPost";
		} else {
			model.addAttribute("likes", likes);
			model.addAttribute("comments", comments);
			model.addAttribute("post", post);

			return "/webpages/forms/viewPost";
		}
	}

	@GetMapping("updatePost.do")
	public String updatepost(int id, Model model) {
		model.addAttribute("post", postDao.findpostById(id));

		return "/webpages/forms/updatePost";
	}

	@PostMapping("submitPostUpdate.do")
	public ModelAndView update(String description, String photo, int postId, RedirectAttributes redir) {

		ModelAndView mv = new ModelAndView();
		Post post = postDao.updatepost(description, photo, postId);
		if (post != null) {
			redir.addFlashAttribute("post", post);
			mv.setViewName("redirect:postUpdated.do");
			return mv;
		} else {
			mv.setViewName("/webpages/failurePage");
			return mv;
		}
	}

	@GetMapping("postUpdated.do")
	public String updatedpost(Post post, Model model) {

		List<Comment> comments = postDao.viewComments(post.getId());

		model.addAttribute("comments", comments);
		model.addAttribute("post", post);
		return "/webpages/forms/viewPost";

	}

	@PostMapping("deletePost.do")
	public ModelAndView deletPost(int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = postDao.deletepost(id);
		if (deleted) {
			redir.addFlashAttribute("post", id);
			mv.setViewName("redirect:postDeleted.do");
			return mv;
		} else {
			mv.setViewName("/webpages/failurePage");
			return mv;
		}

	}

	@GetMapping("postDeleted.do")
	public String deletedPostt(Model model) {
		model.addAttribute("post", postDao.allposts());
		return "/webpages/forms/viewAllPost";
	}

	@GetMapping("createPost.do")
	public String createPost() {
		return "/webpages/forms/postForm";
	}

	@PostMapping("addComment.do")
	public ModelAndView addNewCommentt(String description, int postId, int userId, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Comment newComment = null;
		try {
			newComment = postDao.addComment(description, postId, userId);
		} catch (RuntimeException e) {
			mv.setViewName("\"/webpages/failurePage\"");
			return mv;
		}
		if (newComment != null) {
			redir.addFlashAttribute("comment", newComment);
			mv.setViewName("redirect:commentAdded.do");
			return mv;
		} else {
			mv.setViewName("/webpages/failurePage");
			return mv;
		}

	}

	@GetMapping("commentAdded.do")
	public String addedNewComment(Comment comment, Model model) {
		Post post = postDao.findpostById(comment.getPost().getId());
		List<Comment> comments = postDao.viewComments(post.getId());
		User user = comment.getUser();
		int likes = post.getLikes().size();
		if (post.getLikes().contains(user)) {
			model.addAttribute("likes", likes);
			model.addAttribute("comments", comments);
			model.addAttribute("post", post);
			return "/webpages/forms/LikedPost";
		} else {
			model.addAttribute("likes", likes);
			model.addAttribute("comments", comments);
			model.addAttribute("post", post);

			return "/webpages/forms/viewPost";
		}
	}

	@PostMapping("commentLike.do")
	public String likeComment(int userId, int postId, Model model) {
		boolean liked = postDao.likeComment(userId, postId);
		Post post = postDao.findpostById(postId);
		List<Comment> comments = post.getComments();
		int likes = post.getLikes().size();
		if (liked) {
			model.addAttribute("comments", comments);
			model.addAttribute("likes", likes);
			model.addAttribute("post", post);
			return "/webpages/forms/LikedPost";

		} else
			model.addAttribute("comments", comments);
		model.addAttribute("likes", likes);
		model.addAttribute("post", post);
		return "/webpages/forms/viewPost";
	}

	@GetMapping("GoToProfile.do")
	public String Profile(Model model, int id) {
		User user = userDao.findUserById(id);
		model.addAttribute("user", user);
		return "webpages/userProfile";
	}

	@GetMapping("viewPostByNeighborhood.do")
	public String getNeighborhoodPost(int id, Model model) {
		List<Post> post = postDao.viewAllPostByNeighborhoodById(id);

		model.addAttribute("post", post);
		return "/webpages/forms/TestLanding";
	}
	@GetMapping("viewPostByProfile.do")
	public String getUserPost(String id, Model model) {
		model.addAttribute("post", postDao.viewAllPostByUser(Integer.parseInt(id)));
		return "/webpages/forms/viewAllPost";
	}
	
	

}