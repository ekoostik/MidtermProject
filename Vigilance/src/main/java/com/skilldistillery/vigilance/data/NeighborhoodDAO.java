package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.NeighborhoodEvent;

public interface NeighborhoodDAO {

	 
		
	public NeighborhoodEvent findEventById(int id);
	public NeighborhoodEvent createEvent(NeighborhoodEvent event);
	public NeighborhoodEvent updateEvent(int id, NeighborhoodEvent event);
	public boolean deleteEvent(int id);
	public List <NeighborhoodEvent> allEvents();
	
	public Neighborhood findHoodById(int id);
	public Neighborhood createNeighborhood(Neighborhood nHood);
	public boolean deleteNeighborhood(int id);
	public List <Neighborhood> allNeighborhoods();
	public List<Neighborhood> findNeighborhoodsByCityStateZip(String city, String State, String zipCode);
	void assignNeighborhoodToAddress(int userId, int neighborhoodid);
	
	public Neighborhood findHoodByUserId(int id);

}
