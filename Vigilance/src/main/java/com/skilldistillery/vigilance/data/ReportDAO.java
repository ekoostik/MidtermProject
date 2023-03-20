package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Report;

public interface ReportDAO {

	public Report findEventById(int id);
	public Report createEvent(Report report);
	public Report updateEvent(int id, Report report);
	public boolean deleteEvent(int id);
	public List <Report> reports();
}
