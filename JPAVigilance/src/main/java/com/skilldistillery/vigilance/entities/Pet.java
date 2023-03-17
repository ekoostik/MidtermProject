package com.skilldistillery.vigilance.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Pet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "species")
	private String species;
	
	@Column(name = "tag")
	private Boolean tagged;
	
	@Column(name = "breed")
	private String breed;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "name")
	private String name;
	
	public Pet() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public boolean isTagged() {
		return tagged;
	}

	public void setTagged(boolean tagged) {
		this.tagged = tagged;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Pet [id=" + id + ", species=" + species + ", tagged=" + tagged + ", breed=" + breed + ", color=" + color
				+ ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(breed, color, id, name, species, tagged);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pet other = (Pet) obj;
		return Objects.equals(breed, other.breed) && Objects.equals(color, other.color) && id == other.id
				&& Objects.equals(name, other.name) && Objects.equals(species, other.species) && tagged == other.tagged;
	}

}
