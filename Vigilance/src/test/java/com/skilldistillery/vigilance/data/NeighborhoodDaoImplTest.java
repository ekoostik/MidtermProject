package com.skilldistillery.vigilance.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import javax.persistence.EntityManager;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.vigilance.entities.Neighborhood;

class NeighborhoodDaoImplTest {
	private NeighborhoodDoaImpl ndi = new NeighborhoodDoaImpl();
	private EntityManager em;
	private List<Neighborhood> nhood;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
	em = ndi.testQuery();
	
	}

	@AfterEach
	void tearDown() throws Exception {
		ndi = null;
		em.close();
	}

	@Test
	void test_neighborhood_address_query() {
	nhood = ndi.findNeighborhoodsByCityStateZip("Silverton", "CO", "80102");
	assertNotNull(nhood);
	assertTrue(nhood.size() == 1);
	assertEquals("Shady Acres", nhood.get(0));
	}

}
