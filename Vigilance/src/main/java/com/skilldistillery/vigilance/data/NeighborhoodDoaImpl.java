package com.skilldistillery.vigilance.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.NeighborhoodEvent;
import com.skilldistillery.vigilance.entities.User;

@Service
@Transactional
public class NeighborhoodDoaImpl implements NeighborhoodDAO {

	@PersistenceContext
	private EntityManager em;

	// ****************** Neighborhood Event ********************
	@Override
	public NeighborhoodEvent createEvent(NeighborhoodEvent event) {

		NeighborhoodEvent newEvent = new NeighborhoodEvent();

		newEvent.setName(event.getName());
		newEvent.setDescription(event.getDescription());
		newEvent.setEventDate(event.getEventDate());
		newEvent.setCreateDate(event.getCreateDate());
		newEvent.setActive(true);
		newEvent.setUser(event.getUser());
		newEvent.setNeighborhoodId(event.getNeighborhoodId());
		newEvent.setAddress(event.getAddress());

		em.persist(newEvent);

		return newEvent;
	}

	@Override
	public NeighborhoodEvent updateEvent(int id, NeighborhoodEvent event) {
		// TODO Auto-generated method stub
		NeighborhoodEvent updated = em.find(NeighborhoodEvent.class, id);
		updated.setName(event.getName());
		updated.setDescription(event.getDescription());
		updated.setEventDate(event.getEventDate());
		updated.setNeighborhoodId(event.getNeighborhoodId());
		updated.setAddress(event.getAddress());

		return updated;
	}

	@Override
	public boolean deleteEvent(int id) {
		// TODO Auto-generated method stub
		boolean deleted = false;
		NeighborhoodEvent toDelete = em.find(NeighborhoodEvent.class, id);
		if (em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public NeighborhoodEvent findEventById(int id) {

		return em.find(NeighborhoodEvent.class, id);
	}

	@Override
	public List<NeighborhoodEvent> allEvents() {
		String jpql = "SELECT n FROM NeighborhoodEvent n";
		return em.createQuery(jpql, NeighborhoodEvent.class).getResultList();
	}

	// ************************** Neighborhood ********************
	@Override
	public Neighborhood findHoodById(int id) {
		return em.find(Neighborhood.class, id);
	}

	@Override
	public Neighborhood createNeighborhood(Neighborhood nHood) {
		Neighborhood newHood = new Neighborhood();
		
		newHood.setName(nHood.getName());
		newHood.setImageUrl(nHood.getImageUrl());
		newHood.setDescription(nHood.getDescription());
		newHood.setCreateDate(nHood.getCreateDate());

		em.persist(newHood);

		return newHood;
	}
	
	//********************** Added By Rob Tisdale *********************
	
	@Override
	public List<Neighborhood> findNeighborhoodsByCityStateZip(String city, String state, String zipCode) {
		List<Neighborhood> nhood = new ArrayList<>();
		String jpql = "SELECT DISTINCT n FROM Neighborhood n JOIN FETCH"
					+ " n.addresses a WHERE a.city = :city AND a.state = :state AND a.zipCode = :zipCode";
		
		nhood = em.createQuery(jpql, Neighborhood.class)
				.setParameter("city", city)
				.setParameter("state", state)
				.setParameter("zipCode", zipCode)
				.getResultList();
		 return nhood;
		
	}
	@Override
	public void assignNeighborhoodToAddress(int userId, int neighborhoodid) {
		User user = em.find(User.class, userId);
		Neighborhood neighborhood = em.find(Neighborhood.class, neighborhoodid);
		Address address = user.getHousehold().getAddress();
		try {
			address.setNeighborhood(neighborhood);
			em.persist(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean deleteNeighborhood(int id) {
		boolean deleted = false;
		Neighborhood toDelete = em.find(Neighborhood.class, id);
		if (em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public List<Neighborhood> allNeighborhoods() {
		String jpql = "SELECT n FROM Neighborhood n";
		return em.createQuery(jpql, Neighborhood.class).getResultList();
	}

}
