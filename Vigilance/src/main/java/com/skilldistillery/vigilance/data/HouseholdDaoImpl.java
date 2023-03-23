package com.skilldistillery.vigilance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.Pet;
import com.skilldistillery.vigilance.entities.Vehicle;

@Transactional
@Service
public class HouseholdDaoImpl implements HouseholdDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override 
	public HouseHold createNewHousehold(HouseHold household) {
		em.persist(household);
		em.flush();
		return household;
	}
	
	@Override
	public boolean deleteHoushold(int householdId) {
		HouseHold deleteHousehold = em.find(HouseHold.class, householdId);
		em.remove(deleteHousehold);
		em.flush();
		
		if (em.find(HouseHold.class, householdId) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public HouseHold updateHousehold(int householdId, HouseHold household) {
		HouseHold updateHousehold = em.find(HouseHold.class, householdId);
		updateHousehold.setOccupants(household.getOccupants());
		return updateHousehold;
	}
	
	@Override
	public Pet addPet(int householdId, Pet pet) {
		HouseHold household = em.find(HouseHold.class, householdId);
		pet.setHouseHold(household);
		em.persist(pet);
		em.flush();
		
		return pet;	
	} 

	
	@Override
	public Pet updatePet(int petId, Pet pet) {
		Pet updatePet = em.find(Pet.class, petId);
		updatePet.setName(pet.getName());
		updatePet.setSpecies(pet.getSpecies());
		updatePet.setBreed(pet.getBreed());
		updatePet.setColor(pet.getColor());
		updatePet.setTagged(pet.isTagged());
		return updatePet;	
	} 
	
	
	@Override
	public Pet removePet(int petId) {
		Pet removePet = em.find(Pet.class, petId);
		em.remove(removePet);
		return removePet;	
	} 
	
	@Override
	public Vehicle addVehicle(int householdId, Vehicle vehicle) {
		HouseHold household = em.find(HouseHold.class, householdId);
		vehicle.setHouse(household);
		em.persist(household);
		em.persist(vehicle);
		em.flush();
		return vehicle;	
	} 
	@Override
	public Vehicle updateVehicle(int vehicleId, Vehicle vehicle) {
		Vehicle updateVehicle = em.find(Vehicle.class, vehicleId);
		updateVehicle.setMake(vehicle.getMake());
		updateVehicle.setModel(vehicle.getModel());
		updateVehicle.setColor(vehicle.getColor());
		updateVehicle.setDescription(vehicle.getDescription());
		return updateVehicle;	
	} 
	@Override
	public List<Vehicle> listAllVehiclesByHousehold(int householdId) {
		//ysql> SELECT * FROM vehicle v JOIN household h ON v.household_id = h.id WHERE h.id = 3;
		String jpql = "SELECT v FROM Vehicle v JOIN House h ON v.household_id = h.id WHERE h.id = :householdId";
		List<Vehicle> vehicles = em.createQuery(jpql, Vehicle.class)
				.setParameter("householdId", householdId)
				.getResultList();
		return vehicles;	
	} 
	@Override
	public Vehicle removeVehicle(int vehicleId) {
		Vehicle removeVehicle = em.find(Vehicle.class, vehicleId);
		em.remove(removeVehicle);
		return removeVehicle;	
	}

	@Override
	public List<Pet> listAllPetsByHousehold(int householdId) {
		String jpql = "SELECT p FROM Pet p JOIN FETCH p.house h WHERE h.id = :householdId";
		List<Pet> pets = em.createQuery(jpql, Pet.class)
				.setParameter("householdId", householdId)
				.getResultList();
		return pets;
	} 


	
	
}
