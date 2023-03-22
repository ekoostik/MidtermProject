package com.skilldistillery.vigilance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.NeighborhoodEvent;
import com.skilldistillery.vigilance.entities.Post;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;

@Service
public class ProfileDaoImpl implements ProfileDao {
	//Collin

	@PersistenceContext
	private EntityManager em;

	// mysql> SELECT post.description, post.create_date FROM user JOIN post ON
	// post.user_id = user.id WHERE user.id = 2

	@Override
	public List<Post> retrieveAllPosts(User user) {
		String jpql = "SELECT p FROM Post p WHERE p.user = ?1";
		return em.createQuery(jpql, Post.class).setParameter(1, user).getResultList();
		
	}

	@Override
	public List<Report> retrieveAllReports(User user) {
		String jpql = "SELECT r FROM Report r WHERE r.user = ?1";
		return em.createQuery(jpql, Report.class).setParameter(1, user).getResultList();
	}

	@Override
	public List<NeighborhoodEvent> retrieveAllEvents(User user) {
		String jpql = "SELECT n FROM NeighborhoodEvent n WHERE n.user = ?1";
		return em.createQuery(jpql, NeighborhoodEvent.class).setParameter(1, user).getResultList();
	}

}
