package com.skilldistillery.vigilance.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "home_owner_association")
public class HomeOwnerAssociation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;
	
	@Column(name = "monthly_due")
	private double monthlyDues;
	
//	TODO -- add Foreign Key neighborhood_id
	@OneToOne
	@JoinColumn(name="neighborhood_id")
	private Neighborhood neighborhood;

	public HomeOwnerAssociation() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getMonthlyDues() {
		return monthlyDues;
	}

	public void setMonthlyDues(double monthlyDues) {
		this.monthlyDues = monthlyDues;
	}

	public Neighborhood getNeighborhood() {
		return neighborhood;
	}

	public void setNeighborhood(Neighborhood neighborhood) {
		this.neighborhood = neighborhood;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HomeOwnerAssociation other = (HomeOwnerAssociation) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "HomeOwnerAssociation [id=" + id + ", name=" + name + ", description=" + description + ", monthlyDues="
				+ monthlyDues + "]";
	}

}
