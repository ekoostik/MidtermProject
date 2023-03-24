package com.skilldistillery.vigilance.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Animal;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;

@Service
@Transactional
public class ReportDoaImpl implements ReportDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Report findReportById(int id) {

		return em.find(Report.class, id);
	}

	@Override
	public Report createReport(Report report, User user) {
		Report newReport = new Report();
		
		newReport.setUser(user);
		newReport.setReportDate(report.getReportDate());
		newReport.setDesription(report.getDesription());
		newReport.setContactAuthority(report.isContactAuthority());
		newReport.setAnimals(report.getAnimals());
		newReport.setSubject(report.getSubject());
	
		
		em.persist(newReport);
		
		return newReport;		
	}

	@Override
	public Report updateReport(String description, LocalDate reportDate, Boolean contactAuthority, int id, String subject) {
		Report updated = em.find(Report.class, id);
		updated.setDescription(description);
		updated.setReportDate(reportDate);
		updated.setContactAuthority(contactAuthority);
		updated.setSubject(subject);
		
		return null;
	}

	@Override
	public boolean deleteReport(int id) {
		boolean deleted = false;
		Report toDelete=em.find(Report.class, id);
		if(em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
		
	}

	@Override
	public List<Report> reportsByNeighborhood(int nId) {
		String jpql ="SELECT r FROM Report r WHERE r.user.household.address.neighborhood.id = :nId";
		return em.createQuery(jpql, Report.class)
				.setParameter("nId",nId)
				.getResultList();		
		
	}

	@Override
	public List<Animal> viewAnimalReports(int id) {
		Report report = em.find(Report.class, id);
		List<Animal> animals = report.getAnimals();
		
		return animals;
	}

	@Override
	public Animal addAnimalReport(String description, int id, int userId) {
		Report report = em.find(Report.class, id);
		User user = em.find(User.class, userId);
		Animal addAnimal = new Animal();
		
		addAnimal.setReport(report);
	
		
		return null;
	}
	
	@Override
	public Animal findAnimalByReportId(int id) {
		Report report = em.find(Report.class, id );
//		int reportId
		return null;
	}
	
}
