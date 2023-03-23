package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.Pet;
import com.skilldistillery.vigilance.entities.User;
import com.skilldistillery.vigilance.entities.Vehicle;

public interface HouseholdDAO {

	public HouseHold createNewHousehold(HouseHold household);
	public HouseHold updateHousehold(int householdId, HouseHold household);
	public List<Pet> listAllPetsByHousehold(int householdId);
	public Pet addPet(int householdId, Pet pet);
	public Pet updatePet(int petId, Pet pet);
	public Pet removePet(int petId);
	public Vehicle addVehicle(int householdId, Vehicle vehicle);
	public Vehicle updateVehicle(int householdId, Vehicle vehicle);
	public List<Vehicle>listAllVehiclesByHousehold(int householdId);
	public Vehicle removeVehicle(int vehicleId);
	boolean deleteHoushold(int householdId);
	
 

}
