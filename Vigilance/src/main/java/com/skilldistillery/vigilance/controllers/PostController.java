package com.skilldistillery.vigilance.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.PostDAO;
import com.skilldistillery.vigilance.entities.Comment;
import com.skilldistillery.vigilance.entities.Post;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class PostController {

	@Autowired
	private PostDAO postDao;

	@RequestMapping(path = "viewAllposts.do", method = RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("post", postDao.allposts());

		return "/webpages/forms/viewAllPost";
	}

	@RequestMapping(path = "addPost.do", method = RequestMethod.POST)
	public ModelAndView addNewpost(String description, String photo, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Post newpost = null;
		User loggedInUser = (User) session.getAttribute("loggedinuser");

		try {
			int userId = loggedInUser.getId();
			int neighborhood = loggedInUser.getHousehold().getAddress().getNeighborhood().getId();
			newpost = postDao.createpost(description, photo, userId, neighborhood);
		} catch (RuntimeException e) {
			mv.setViewName("error");
			return mv;
		}
		if (newpost != null) {
			redir.addFlashAttribute("post", newpost);
			mv.setViewName("redirect:PostAdded.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "PostAdded.do", method = RequestMethod.GET)
	public ModelAndView addedNpost() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webpages/forms/viewPost");
		return mv;
	}

	@RequestMapping(path = "getPostById.do", method = RequestMethod.GET)
	public String getnpost(int id, Model model) {
		Post post = postDao.findpostById(id);
		List<Comment> comments = postDao.viewComments(id);
		int likes = post.getLikes().size();
		model.addAttribute("likes", likes);
		model.addAttribute("comments", comments);
		model.addAttribute("post", post);

		return "/webpages/forms/viewPost";
	}

	@RequestMapping(path = "updatePost.do", method = RequestMethod.GET)
	public String updatepost(int id, Model model) {
		model.addAttribute("post", postDao.findpostById(id));

		return "/webpages/forms/TestLanding";
	}

	@RequestMapping(path = "submitPostUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(String description, int userId, int postId, RedirectAttributes redir) {

		ModelAndView mv = new ModelAndView();
		Post post = postDao.updatepost(description, userId, postId);
		if (post != null) {
			redir.addFlashAttribute("post", post);
			mv.setViewName("redirect:postUpdated.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}
	}

	@RequestMapping(path = "postUpdated.do", method = RequestMethod.GET)
	public String updatedpost(Post post, Model model) {

		List<Comment> comments = postDao.viewComments(post.getId());
		model.addAttribute("comments", comments);

		model.addAttribute("post", post);
		return "/webpages/forms/viewPost";

	}

	@RequestMapping(path = "deletePost.do", method = RequestMethod.POST)
	public ModelAndView deletPost(int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = postDao.deletepost(id);
		if (deleted) {
			redir.addFlashAttribute("post", id);
			mv.setViewName("redirect:postDeleted.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "postDeleted.do", method = RequestMethod.GET)
	public String deletedPostt() {
		return "/webpages/home";
	}

	@RequestMapping(path = "createPost.do", method = RequestMethod.GET)
	public String createPost() {
		return "/webpages/forms/postForm";
	}

	@RequestMapping(path = "addComment.do", method = RequestMethod.POST)
	public ModelAndView addNewCommentt(String description, int postId, int userId, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Comment newComment = null;
		try {
			newComment = postDao.addComment(description, postId, userId);
		} catch (RuntimeException e) {
			mv.setViewName("error");
			return mv;
		}
		if (newComment != null) {
			redir.addFlashAttribute("comment", newComment);
			mv.setViewName("redirect:commentAdded.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "commentAdded.do", method = RequestMethod.GET)
	public String addedNewComment(Comment comment, Model model) {
		Post post = postDao.findpostById(comment.getPost().getId());
		List<Comment> comments = postDao.viewComments(post.getId());
		int likes = post.getLikes().size();
		model.addAttribute("comments", comments);
		model.addAttribute("likes", likes);
		model.addAttribute("post", post);
		return "/webpages/forms/viewPost";
	}

	@RequestMapping(path = "commentLike.do", method = RequestMethod.POST)
	public ModelAndView likeComment(int userId, int postId) {
		ModelAndView mv = new ModelAndView();
		boolean liked = postDao.likeComment(userId, postId);
		if (liked) {
			mv.setViewName("/webpages/forms/viewPost");
		}
		return mv;
	}

}
