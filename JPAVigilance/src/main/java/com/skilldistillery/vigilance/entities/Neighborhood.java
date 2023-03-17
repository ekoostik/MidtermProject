package com.skilldistillery.vigilance.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Neighborhood {

	public Neighborhood() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
}
