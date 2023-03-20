package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.PostDAO;

import com.skilldistillery.vigilance.entities.Post;

@Controller
public class PostController {

	@Autowired
	private PostDAO postDao;

	@RequestMapping(path = "viewAllposts.do", method = RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("post", postDao.allposts());

		return "/webpages/forms/postForm";
	}

	@RequestMapping(path = "addPost.do", method = RequestMethod.POST)
	public ModelAndView addNpost(Post post, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Post newpost = null;
		try {
			newpost = postDao.createpost(post);
		} catch (RuntimeException e) {
			mv.setViewName("error");
			return mv;
		}
		if (newpost != null) {
			redir.addFlashAttribute("post", post);
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
		mv.setViewName("/webpages/forms/postForm");
		return mv;
	}

	@RequestMapping(path = "getPostById.do", method = RequestMethod.GET)
	public String getnpost(int id, Model model) {
		Post post = postDao.findpostById(id);
		model.addAttribute("post", post);

		return "/webpages/forms/postForm";
	}

	@RequestMapping(path = "updatePost.do", method = RequestMethod.GET)
	public String updatepost(int id, Model model) {
		model.addAttribute("post", postDao.findpostById(id));

		return "updatepost";
	}

	@RequestMapping(path = "submitPostUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(int id, Post post, RedirectAttributes redir) {

		ModelAndView mv = new ModelAndView();
		Post updated = postDao.updatepost(id, post);
		if (updated != null) {
			redir.addFlashAttribute("post", post);
			mv.setViewName("redirect:postUpdated.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}
	}

	@RequestMapping(path = "postUpdated.do", method = RequestMethod.GET)
	public String updatedpost() {

		return "viewpost";
	}
	
	
	
	
	@RequestMapping(path ="deletePost.do" , method = RequestMethod.POST)
	public ModelAndView deletPost(int id, RedirectAttributes redir) {
	ModelAndView mv = new ModelAndView();
	boolean deleted =postDao.deletepost(id);
	if(deleted) {
		redir.addFlashAttribute("post", id);
		mv.setViewName("redirect:postDeleted.do");
		return mv;
	}
	else {
		mv.setViewName("error");
		return mv;
	}
	
	}

@RequestMapping(path="postDeleted.do", method = RequestMethod.GET)
	public String deletedPostt() {
	return "/webpages/forms/postForm";
}

	

}
