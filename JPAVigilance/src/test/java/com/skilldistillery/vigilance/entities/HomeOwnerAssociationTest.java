package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class HomeOwnerAssociationTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private HomeOwnerAssociation hoa;
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
		hoa = em.find(HomeOwnerAssociation.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		hoa = null;
	}

	@Test
	void test_HOA_mappings() {
		assertNotNull(hoa);
		assertEquals("Sell-Your-Soul Home Owers Association", hoa.getName());
		assertEquals(135, hoa.getMonthlyDues());
	}
}
