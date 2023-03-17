package com.skilldistillery.vigilance.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="person_of_interest")
public class PersonOfInterest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "incident_time")
	private LocalDateTime incidentTime;

	private String description;

//	@Column(name="report_id")
//	private int reportId;

	public PersonOfInterest() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getIncidentTime() {
		return incidentTime;
	}

	public void setIncidentTime(LocalDateTime incidentTime) {
		this.incidentTime = incidentTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		PersonOfInterest other = (PersonOfInterest) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "PersonOfInterest [id=" + id + ", incidentTime=" + incidentTime + ", description=" + description + "]";
	}
}
