package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Comment comment;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAVigilance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		comment = em.find(Comment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}
	
	@Test
	void test_Comment_Mappings_CreateDate() {
		assertNotNull(comment);
		assertNotNull(comment.getDescription());
		assertEquals("Yeah, I'll take a few for my garden!!!", comment.getDescription());
	}
	
	@Test 
	void test_Comment_User_Mappings() {
		assertNotNull(comment);
		assertNotNull(comment.getUsers());
		assertTrue(comment.getUsers().isEmpty());
	}
	
	@Test
	void test_Comment_Post_Mappings() {
		assertNotNull(comment);
		assertNotNull(comment.getPost());
		assertEquals("I have a bunch of plants I need to rehome, any takers?",comment.getPost().getDescription());
	}
	


}
