package com.skilldistillery.vigilance.entities;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private boolean enabled;
	
	private String role;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String email;
	
	@ManyToOne
	@JoinColumn(name="household_id")
	private HouseHold household;
	
	@Column(name="profile_url")
	private String profilePic;
	
	@Column(name="about_me")
	private String aboutme;
	
	@Column(name="create_date")
	@CreationTimestamp
	private  Date createDate;
	
	@Column(name="update_date")
	private Date updateDate;
	
	@Column(name="date_of_birth")
	private LocalDate dateOfBirth;
	
	@OneToMany(mappedBy="userId")
	private List<EventComment> eventComments;
	
	@OneToMany(mappedBy="user")
	private List<NeighborhoodEvent> neighborhoodEvent;
//	
//	private Comment comment;
//	
//	private Post post;
//	
	@OneToMany(mappedBy="user")
	private List<Report> reports;
	
	
	
	
	public User(int id, String username, String password, int active, String fname, String lname, String email) {
		super();
	}
	
	public User() {
		super(); 
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getAboutme() {
		return aboutme;
	}

	public void setAboutme(String aboutme) {
		this.aboutme = aboutme;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate birthDate) {
		this.dateOfBirth = birthDate;
	}

	public List<NeighborhoodEvent> getNeighborhoodEvent() {
		return neighborhoodEvent;
	}

	public void setNeighborhoodEvent(List<NeighborhoodEvent> neighborhoodEvent) {
		this.neighborhoodEvent = neighborhoodEvent;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}



	public List<Report> getReports() {
		return reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}

	public List<EventComment> getEventComments() {
		return eventComments;
	}

	public void setEventComments(List<EventComment> eventComments) {
		this.eventComments = eventComments;
	}

	public HouseHold getHousehold() {
		return household;
	}

	public void setHousehold(HouseHold household) {
		this.household = household;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", household=" + household + ", profilePic=" + profilePic + ", aboutme=" + aboutme + ", createDate="
				+ createDate + ", updateDate=" + updateDate + ", dateOfBirth=" + dateOfBirth + ", eventComments="
				+ eventComments + ", neighborhoodEvent=" + neighborhoodEvent + ", reports=" + reports + "]";
	}

	
}