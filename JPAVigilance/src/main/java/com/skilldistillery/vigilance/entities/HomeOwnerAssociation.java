package com.skilldistillery.vigilance.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class HomeOwnerAssociation {
	
	public HomeOwnerAssociation() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

}
