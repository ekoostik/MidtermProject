package com.skilldistillery.vigilance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.NeighborhoodEvent;

@Service
@Transactional
public class NeighborhoodEventDoaImpl implements NeighborhoodEventDAO {
	
	@PersistenceContext
	private EntityManager em;


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
		NeighborhoodEvent updated =em.find(NeighborhoodEvent.class, id);
		updated.setName(event.getName());
		updated.setDescription(event.getDescription());
		updated.setEventDate(event.getEventDate());
		updated.setCreateDate(event.getCreateDate());
		updated.setUser(event.getUser());
		updated.setNeighborhoodId(event.getNeighborhoodId());
		updated.setAddress(event.getAddress());
		
		return updated;
	}

	@Override
	public boolean deleteEvent(int id) {
		// TODO Auto-generated method stub
		boolean deleted = false;
		NeighborhoodEvent toDelete=em.find(NeighborhoodEvent.class, id);
		if(em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public NeighborhoodEvent findEventById(int id) {
		// TODO Auto-generated method stub
		
		return em.find(NeighborhoodEvent.class, id);
	}

	@Override
	public List<NeighborhoodEvent> allEvents() {
		// TODO Auto-generated method stub
		String jpql ="SELECT n FROM NeighborhoodEvent n";
		return em.createQuery(jpql, NeighborhoodEvent.class).getResultList();
	}
	
}
