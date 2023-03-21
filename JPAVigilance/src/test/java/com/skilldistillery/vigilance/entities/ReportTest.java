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

class ReportTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Report report;

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
		report = em.find(Report.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		report = null;
	}

	@Test
	void test_report_map() {
		assertNotNull(report);
		assertEquals("Moose found in driveway", report.getDesription());;
	}
	
	@Test
	void test_userId_map() {
		
	assertNotNull(report.getUser());
	assertEquals(2, report.getUser().getId());
		
	}
	
	@Test
	void test_animal_map() {
		assertNotNull(report.getAnimals());
		assertFalse(report.getAnimals().isEmpty());
	}
	@Test
	void test_personOI_map() {
		report=em.find(Report.class, 2);
		assertNotNull(report.getAnimals());
		assertFalse(report.getAnimals().isEmpty());
	}

}
