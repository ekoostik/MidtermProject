package com.skilldistillery.vigilance.data;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Comment;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.Post;
import com.skilldistillery.vigilance.entities.User;

@Service
@Transactional
public class PostDaoImpl implements PostDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Post createpost(String description, String photo, int userId, int neighborhood) {

		User user = em.find(User.class, userId);
		Neighborhood nh = em.find(Neighborhood.class, neighborhood);
		Post newpost = new Post();

		newpost.setUser(user);
		newpost.setNid(nh);
		newpost.setDescription(description);

		newpost.setImage(photo);

		em.persist(newpost);

		return newpost;
	}

	@Override
	public Post updatepost(String description, int userId, int postId) {
		// TODO Auto-generated method stub
		Post updated = em.find(Post.class, postId);
		updated.setDescription(description);
//		updated.setImage(post.getImage());

		return updated;
	}

	@Override
	public boolean deletepost(int id) {
		boolean deleted = false;
		Post toDelete = em.find(Post.class, id);
		if (em.contains(toDelete)) {
			List<Comment> comments = toDelete.getComments();
			for (Comment comment : comments) {
				em.remove(comment);
			}

			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public Post findpostById(int id) {

		return em.find(Post.class, id);
	}

	@Override
	public List<Post> allposts() {
		// TODO Auto-generated method stub
		String jpql = "SELECT p FROM Post p";
		return em.createQuery(jpql, Post.class).getResultList();
	}

	@Override
	public List<Comment> viewComments(int postid) {
		// TODO Auto-generated method stub
		Post post = em.find(Post.class, postid);
		List<Comment> comments = post.getComments();

		return comments;
	}

	@Override
	public Comment addComment(String description, int postId, int userId) {

		Post post = em.find(Post.class, postId);
		User user = em.find(User.class, userId);
		Comment newComment = new Comment();

		newComment.setPost(post);
		newComment.setDescription(description);
		newComment.setUser(user);

		em.persist(newComment);

		return newComment;
	}

	@Override
	public boolean likeComment(int userId, int postId) {
//		boolean like = false;
		Post post = em.find(Post.class, postId);
		User user =em.find(User.class, userId);
		
		
		
		
		List<User>likeUser = new ArrayList<>();
		List<Post>likePost = new ArrayList<>();
		likeUser.add(user);
		likePost.add(post);
	
		
		
		user.setPostLikes(likePost);
		post.setLikes(likeUser);
//		em.persist(user);
		em.persist(post);
		
		
		return true;
	}

}
