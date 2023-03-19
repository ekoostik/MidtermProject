package com.skilldistillery.vigilance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Post;

@Service
@Transactional
public class PostDaoImpl implements PostDAO {

	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Post createpost(Post post) {
		
		Post newpost = new Post();
		newpost.setDescription(post.getDescription());
		newpost.setImage(post.getDescription());
		newpost.setId(post.getId());
		newpost.setCreateDate(post.getCreateDate());
//		newpost.setNeighborhoodId(post.getNeighborhoodId());
	
		em.persist(newpost);
		
		return newpost;
	}

	@Override
	public Post updatepost(int id, Post post) {
		// TODO Auto-generated method stub
		Post updated =em.find(Post.class, id);
		updated.setDescription(post.getDescription());
		updated.setImage(post.getDescription());
		updated.setCreateDate(post.getCreateDate());

		
		return updated;
	}

	@Override
	public boolean deletepost(int id) {
		// TODO Auto-generated method stub
		boolean deleted = false;
		Post toDelete=em.find(Post.class, id);
		if(em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public Post findpostById(int id) {
		// TODO Auto-generated method stub
		
		return em.find(Post.class, id);
	}

	@Override
	public List<Post> allposts() {
		// TODO Auto-generated method stub
		String jpql ="SELECT p FROM Post p";
		return em.createQuery(jpql, Post.class).getResultList();
	}
	

}
