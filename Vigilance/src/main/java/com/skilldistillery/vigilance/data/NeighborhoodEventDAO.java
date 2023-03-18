package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.NeighborhoodEvent;

public interface NeighborhoodEventDAO {

	 
		
	public NeighborhoodEvent findEventById(int id);
	public NeighborhoodEvent createEvent(NeighborhoodEvent event);
	public NeighborhoodEvent updateEvent(int id, NeighborhoodEvent event);
	public boolean deleteEvent(int id);
	public List <NeighborhoodEvent> allEvents();

}
