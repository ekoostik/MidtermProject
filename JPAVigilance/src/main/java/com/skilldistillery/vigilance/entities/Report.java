package com.skilldistillery.vigilance.entities;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	@Column(name = "report_time")
	private Date reportDate;

	@Column(name = "contact_authority")
	private Boolean contactAuthority;

//	@Column(name = "user_id")
//	private User user;

	public Report() {

	}

	public String getDesription() {
		return description;
	}

	public void setDesription(String description) {
		this.description = description;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Boolean isContactAuthority() {
		return contactAuthority;
	}

	public void setContactAuthority(Boolean contactAuthority) {
		this.contactAuthority = contactAuthority;
	}

//	
//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}

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
		Report other = (Report) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", desription=" + description + ", reportDate=" + reportDate + ", contactAuthority="
				+ contactAuthority + "]";
	}

}
