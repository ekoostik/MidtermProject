package com.skilldistillery.vigilance.entities;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Neighborhood {

	public Neighborhood() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="image_url")
	private String imageUrl;
	
	private String description;
	
	@Column(name="create_date")
	private Date createDate;
	
	@OneToMany(mappedBy="neighborhood")
	private List<Address> addresses;
	

	@OneToMany(mappedBy="neighborhoodId")
	private List<NeighborhoodEvent> nEvents;
	
	@OneToMany(mappedBy = "nid")
	private List<Post> posts;

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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public List<NeighborhoodEvent> getnEvents() {
		return nEvents;
	}

	public void setnEvents(List<NeighborhoodEvent> nEvents) {
		this.nEvents = nEvents;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
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
		Neighborhood other = (Neighborhood) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Neighborhood [id=" + id + ", name=" + name + ", imageUrl=" + imageUrl + ", description=" + description
				+ ", createDate=" + createDate + "]";
	}
	
	
}
