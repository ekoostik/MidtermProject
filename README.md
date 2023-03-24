# MidtermProject - Vigilance 

## Members & Responsibilities
1. Kira Stout - Database Administrator (DBA)
2. Collin Wheat - Scrum Master (SM)
3. David Dunlevy - Repo Owner
4. Rob Tisdale - Dev

## Description
This program is designed to bring those in respective neighborhoods together and keep everyone in the loop regarding activities in their immediate vicinity through sharing events, reports, and posts.

## Instructions and expected outcomes
Users are able to login with username and password (if they dont have an account, they can register ) and be brought to their respective neighborhoods portal. Once there, users will be able to interact with others in their neighborhood, share posts, events, and submit reports/alerts of suspicious activity within the area they want others to be on the lookout for. 
1. User can make posts to be sent to the neighborhood which others can reply to
2. User can make events to share
3. User can make reports to share
4. User can edit their profile information and picture.
5. An administrator has access to a specific account which grants them overseeing privileges of all users. As well as activate and deactivate users.

***TESTING CREDENTIALS***
User
Username: testuser
Password: testuser

Admin
Username: admin
Password: admin	
***TESTING CREDENTIALS***


## Code breakdown
### Backend
#### JPAVigilence - Provides initial persistence architecture and entities required<br>
Entities: and mapping<br>
1. Address: Mapped to Household(1:1) and Neighborhood (1:1)
2. Animal: Mapped to report (M:1)
3. Comment: Mapped to user (M:1)
4. EventComment: Mapped to Event (M:1) and User (M:1)
5. HouseHold :Mapped to User (1:1) Address (1:1) Vehicle (1:M) and Pet (1:M)
6. Neighborhood: Mapped to Address (1:M) and NeighborhoodEvent (1:M)
7. NeighborhoodEvent: Mapped to User (M:1) Mapped to Neighborhood (M:1)
8. Pet: Mapped to Household (M:1)
9. Report: Mapped to Neighborhood (M:1) and User (M:1)
10. User: Mapped to Many
11. Vehicle: Mapped to Household (M:1)

#### Vigilince - Provides java logic classes, relationship mapping, test classes and frontend jsps
Controllers and Data<br>
The above entities were broken down into 6 controllers with a DAO and DAOImpl for each.
1. Household: Maps household, pet, and vehicle based CRUD
2. Neighborhood: Maps neighborhood event and neighborhood base CRUD
3. Post: Maps all post related CRUD
4. Profile: Maps all profile related CRUD
5. Report: Maps all reports and animal related CRUD
6. User: Maps all registration, login and user CRUD

Particular code notes:

When mapping back to existing JSPs with a logged-in user there was a requirement for the user to be refreshed. i.e session user had to reach back to through controller and call findUserById(int userId) to refresh the data to all respective queries.
```java
//controller
	@RequestMapping(path = "newaddr.do", method = RequestMethod.POST)
	public String newAddress(Address address, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		int householdId = loggedInUser.getHousehold().getId();
		address = userDao.addnewAddress(householdId, address);
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
//DAOImpl
	@Override
	public User findUserById(int userId) {
		User user = em.find(User.class, userId);
		user.getHousehold().getPets().size();
		user.getHousehold().getVehicles().size();
		user.getEventComments().size();
		user.getNeighborhoodEvent().size();
		user.getReports().size();
		return user;
	}
```

### Frontend
Front end was broken up into several sub-directories:
1. Media and formatting (.png, and css) are stored directly under webapp.
2. BootStap is the first sub-directory under WEB-INF which holds all bootstrap based formatting
3. All forms and page jsps are then cached under webpages and the respective sub directories.

## Technologies Used
1. Eclipse
2. Java / JPA / JPQL
3. git / github
4. Spring Boot
5. Gradle
6. MySQL / MySQl Workbench

## Lessons Learned

#### Kira Stout:

#### Collin Wheat:

#### David Dunlevy:

#### Rob Tisdale:
1. Using @Table WITH PROPER TABLE NAME. I accidentally forgot to include the proper name and used camelCase (HouseHold) for the entity name, and SQL automattically assigned it to snake case house_hold which the db couldn’t find.
2. Common sense mapping is key. Much of the logic trying to be implemented became infinitely more difficult as the to link together. ie. User being able to add their address, but address only link is household which wasnt auto-incremented.
3. Session manager allows user to be shared across JSPs throughout the program. 
4. Better to do a single class that handles all needed information from a user and then can assign it to external tables after

Code Snipped:<br>
Needed to re-call the respective methods to allow the data on the page to refresh without needing to refresh the entire page.
```java
	//Verified the session user again and used it access the most recent data (in this case List<Vehicle) and then set and pass the parameter to the existing JSP using the pre-established variables.

	@RequestMapping(path = "vehicleAdded.do", method = RequestMethod.POST)
	public String vehicleAdded( Vehicle vehicle, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		vehicle = householdDao.addVehicle(loggedInUser.getHousehold().getId(), vehicle);
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		List<Vehicle> vehicles = loggedInUser.getHousehold().getVehicles();
		model.addAttribute("vehicles", vehicles);
		return "webpages/userAccount";
	}	
```

