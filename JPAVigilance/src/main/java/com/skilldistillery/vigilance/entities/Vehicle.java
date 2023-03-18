package com.skilldistillery.vigilance.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Vehicle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "make")
	private String make;

	@Column(name = "model")
	private String model;

	@Column(name = "color")
	private String color;

	@Column(name = "description")
	private String description;

	@Column(name = "license_plate_id")
	private Integer licensePlate;

	@Column(name = "state_plate")
	private String statePlate;

	@ManyToOne
	@JoinColumn(name = "household_id")
	private HouseHold house;

	@ManyToOne
	@JoinColumn(name = "vehicle_type_id")
	private Vehicle vehicleDetail;

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(int licensePlate) {
		this.licensePlate = licensePlate;
	}

	public String getStatePlate() {
		return statePlate;
	}

	public void setStatePlate(String statePlate) {
		this.statePlate = statePlate;
	}

	public HouseHold getHouse() {
		return house;
	}

	public void setHouse(HouseHold house) {
		this.house = house;
	}

	public Vehicle getVehicleDetail() {
		return vehicleDetail;
	}

	public void setVehicleDetail(Vehicle vehicleDetail) {
		this.vehicleDetail = vehicleDetail;
	}

	@Override
	public int hashCode() {
		return Objects.hash(color, description, id, licensePlate, make, model, statePlate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Vehicle other = (Vehicle) obj;
		return Objects.equals(color, other.color) && Objects.equals(description, other.description) && id == other.id
				&& Objects.equals(licensePlate, other.licensePlate) && Objects.equals(make, other.make)
				&& Objects.equals(model, other.model) && Objects.equals(statePlate, other.statePlate);
	}

	@Override
	public String toString() {
		return "Vehicle [id=" + id + ", make=" + make + ", model=" + model + ", color=" + color + ", description="
				+ description + ", licensePlate=" + licensePlate + ", statePlate=" + statePlate + "]";
	}

}
