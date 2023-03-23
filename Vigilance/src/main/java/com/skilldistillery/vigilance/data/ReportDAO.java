package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Animal;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;

public interface ReportDAO {

	public Report findReportById(int id);
	public Report createReport(Report report, User user);
	public Report updateReport(int id, Report report);
	public boolean deleteReport(int id);
	public List <Report> reportsByNeighborhood(int nId);
	public List<Animal> viewAnimalReports(int id);
	public Animal addAnimalReport(String description, int id, int userId);
	public Animal findAnimalByReportId(int id);
}
