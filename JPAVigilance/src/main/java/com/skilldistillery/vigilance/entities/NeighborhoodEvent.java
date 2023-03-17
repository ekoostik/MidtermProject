package com.skilldistillery.vigilance.entities;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="neighborhood_event")
public class NeighborhoodEvent {
	
	public NeighborhoodEvent() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name="event_date")
	private Date eventDate;
	
	@Column(name="creation_date")
	private Date createDate;
	
	private boolean active;
	
	@ManyToOne
	@JoinColumn(name="neighborhood_id")
	private Neighborhood neighborhoodId;

	@ManyToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	
	

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

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	



	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Neighborhood getNeighborhoodId() {
		return neighborhoodId;
	}

	public void setNeighborhoodId(Neighborhood neighborhoodId) {
		this.neighborhoodId = neighborhoodId;
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
		NeighborhoodEvent other = (NeighborhoodEvent) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "NeighborhoodEvent [id=" + id + ", name=" + name + ", description=" + description + ", eventDate="
				+ eventDate + ", createDate=" + createDate + ", active=" + active + ", userId=" + 
			  ", addressId="  + "]";
	}
	
	
	
	

}
