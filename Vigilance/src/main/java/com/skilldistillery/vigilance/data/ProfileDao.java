package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.NeighborhoodEvent;
import com.skilldistillery.vigilance.entities.Post;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;


public interface ProfileDao {
	//Collin

	List<Post> retrieveAllPosts(User user);
	List<Report> retrieveAllReports(User user);
	List<NeighborhoodEvent> retrieveAllEvents(User user);
	
}
