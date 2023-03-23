package com.skilldistillery.vigilance.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "image")
	private String image;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDate createDate;
	
	@OneToMany(mappedBy = "post")
	private List<Comment> comments;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "neighborhood_id")
	private Neighborhood nid;
	
	@ManyToMany
	@JoinTable(name="postlikeß", 
	joinColumns=@JoinColumn(name="post_id"),
	inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> likes;

	
	public List<User> getLikes() {
		return likes;
	}

	public void setLikes(List<User> likes) {
		this.likes = likes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Neighborhood getNid() {
		return nid;
	}

	public void setNid(Neighborhood nid) {
		this.nid = nid;
	}

	

	
	@Override
	public String toString() {
		return "Post [id=" + id + ", description=" + description + ", image=" + image + ", createDate=" + createDate
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(createDate, description, id, image);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Post other = (Post) obj;
		return Objects.equals(createDate, other.createDate) && Objects.equals(description, other.description)
				&& id == other.id && Objects.equals(image, other.image);
	}

}
