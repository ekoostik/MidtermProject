package com.skilldistillery.vigilance.entities;

import java.sql.Date;
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
@Table(name = "event_comment")
public class EventComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	
	@Column(name ="create_date")
	private Date createDate;

	@ManyToOne
	@JoinColumn(name ="user_id")
	private User userId;
	
	@ManyToOne
	@JoinColumn(name ="neighborhood_event_id")
	private NeighborhoodEvent neighborhoodEventId;

	public EventComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public NeighborhoodEvent getNeighborhoodEventId() {
		return neighborhoodEventId;
	}

	public void setNeighborhoodEventId(NeighborhoodEvent neighborhoodEventId) {
		this.neighborhoodEventId = neighborhoodEventId;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "EventComment [id=" + id + ", comment=" + comment + ", createDate=" + createDate + "]";
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
		EventComment other = (EventComment) obj;
		return id == other.id;
	}
	
}
