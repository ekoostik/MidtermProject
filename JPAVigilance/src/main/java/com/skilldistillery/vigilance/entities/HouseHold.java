package com.skilldistillery.vigilance.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class HouseHold {
	
	public HouseHold() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int occupants;
	
	@Column(name="address_id")
	private int addressId;
	
	
	//TODO MAP Objects
//	private Address address;
//	
//	private Pet pet;
//	
//	private Vehicle vehicle;
	
	

	public int getId() {
		return id;
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

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
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
		return "HouseHold [id=" + id + ", occupants=" + occupants + ", addressId=" + addressId + "]";
	}
	
	
	

}
