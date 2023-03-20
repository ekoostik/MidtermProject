package com.skilldistillery.vigilance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.NeighborhoodEvent;
import com.skilldistillery.vigilance.entities.Report;

@Service
@Transactional
public class ReportDoaImpl implements ReportDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Report findEventById(int id) {

		return em.find(Report.class, id);
	}

	@Override
	public Report createEvent(Report report) {
		Report newReport = new Report();
		
		newReport.setReportDate(report.getReportDate());
		newReport.setDesription(report.getDesription());
		newReport.setContactAuthority(report.isContactAuthority());
		newReport.setPersonOI(report.getPersonOI());
		newReport.setAnimals(report.getAnimals());
	
		
		em.persist(newReport);
		
		return newReport;		
	}

	@Override
	public Report updateEvent(int id, Report report) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteEvent(int id) {
		boolean deleted = false;
		Report toDelete=em.find(Report.class, id);
		if(em.contains(toDelete)) {
			em.remove(toDelete);
			deleted = true;
		}
		return deleted;
		
	}

	@Override
	public List<Report> reports() {
		String jpql ="SELECT r FROM Report r";
		return em.createQuery(jpql, Report.class).getResultList();		
		
	}

	
}
