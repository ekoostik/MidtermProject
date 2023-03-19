package com.skilldistillery.vigilance.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="household")
public class HouseHold {

	public HouseHold() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int occupants;
	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	// TODO MAP Objects

	@OneToMany(mappedBy = "household")
	private List<User> users;


	@OneToMany(mappedBy = "houseHold")
	private List<Pet> pets;
	
	@OneToMany(mappedBy="house")
	private List<Vehicle> vehicles;

	public int getId() {
		return id;
	}

	public List<Pet> getPets() {
		return pets;
	}

	public void setPets(List<Pet> pets) {
		this.pets = pets;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOccupants() {
		return occupants;
	}

	public void setOccupants(int occupants) {
		this.occupants = occupants;
	}

	

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Vehicle> getVehicles() {
		return vehicles;
	}

	public void setVehicles(List<Vehicle> vehicles) {
		this.vehicles = vehicles;
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
		HouseHold other = (HouseHold) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "HouseHold [id=" + id + ", occupants=" + occupants + ", addressId=" + address + "]";
	}

}
