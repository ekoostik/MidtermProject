package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.vigilance.data.HouseholdDAO;

@Controller
public class HouseholdController {
	
	@Autowired
	private HouseholdDAO householdDao;

}