package com.java;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/submitPortfolio")
public class Servlet extends HttpServlet {

	public static class Experience {
		private String position, company, duration, description;

		public Experience(String position, String company, String duration, String description) {
			this.position = position;
			this.company = company;
			this.duration = duration;
			this.description = description;
		}

		// Getters
		public String getPosition() {
			return position;
		}

		public String getCompany() {
			return company;
		}

		public String getDuration() {
			return duration;
		}

		public String getDescription() {
			return description;
		}
	}

	public static class Education {
		private String degree, institution, duration, grade;

		public Education(String degree, String institution, String duration, String grade) {
			this.degree = degree;
			this.institution = institution;
			this.duration = duration;
			this.grade = grade;
		}

		// Getters
		public String getDegree() {
			return degree;
		}

		public String getInstitution() {
			return institution;
		}

		public String getDuration() {
			return duration;
		}

		public String getGrade() {
			return grade;
		}
	}

	public static class Project {
		private String title, description, technologies, duration, githubLink, liveLink;

		public Project(String title, String description, String technologies, String duration, String githubLink,
				String liveLink) {
			this.title = title;
			this.description = description;
			this.technologies = technologies;
			this.duration = duration;
			this.githubLink = githubLink;
			this.liveLink = liveLink;
		}

		// Getters
		public String getTitle() {
			return title;
		}

		public String getDescription() {
			return description;
		}

		public String getTechnologies() {
			return technologies;
		}

		public String getDuration() {
			return duration;
		}

		public String getGithubLink() {
			return githubLink;
		}

		public String getLiveLink() {
			return liveLink;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// Personal Information
		session.setAttribute("fullName", request.getParameter("fullName"));
		session.setAttribute("email", request.getParameter("email"));
		session.setAttribute("phone", request.getParameter("phone"));
		session.setAttribute("location", request.getParameter("location"));
		session.setAttribute("bio", request.getParameter("bio"));
		session.setAttribute("github", request.getParameter("github"));
		session.setAttribute("linkedin", request.getParameter("linkedin"));
		session.setAttribute("website", request.getParameter("website"));

		// Skills
		session.setAttribute("skills", request.getParameter("skills"));

		// Experience
		List<Experience> experiences = new ArrayList<>();
		String[] positions = request.getParameterValues("position");
		String[] companies = request.getParameterValues("company");
		String[] expDurations = request.getParameterValues("expDuration");
		String[] expDescriptions = request.getParameterValues("expDescription");

		if (positions != null) {
			for (int i = 0; i < positions.length; i++) {
				if (positions[i] != null && !positions[i].trim().isEmpty()) {
					experiences.add(
							new Experience(positions[i], companies != null && i < companies.length ? companies[i] : "",
									expDurations != null && i < expDurations.length ? expDurations[i] : "",
									expDescriptions != null && i < expDescriptions.length ? expDescriptions[i] : ""));
				}
			}
		}
		session.setAttribute("experiences", experiences);

		// Education
		List<Education> educations = new ArrayList<>();
		String[] degrees = request.getParameterValues("degree");
		String[] institutions = request.getParameterValues("institution");
		String[] eduDurations = request.getParameterValues("eduDuration");
		String[] grades = request.getParameterValues("grade");

		if (degrees != null) {
			for (int i = 0; i < degrees.length; i++) {
				if (degrees[i] != null && !degrees[i].trim().isEmpty()) {
					educations.add(new Education(degrees[i],
							institutions != null && i < institutions.length ? institutions[i] : "",
							eduDurations != null && i < eduDurations.length ? eduDurations[i] : "",
							grades != null && i < grades.length ? grades[i] : ""));
				}
			}
		}
		session.setAttribute("educations", educations);

		// Projects
		List<Project> projects = new ArrayList<>();
		String[] titles = request.getParameterValues("projectTitle");
		String[] projDescriptions = request.getParameterValues("projectDescription");
		String[] technologies = request.getParameterValues("technologies");
		String[] projDurations = request.getParameterValues("projectDuration");
		String[] githubLinks = request.getParameterValues("githubLink");
		String[] liveLinks = request.getParameterValues("liveLink");

		if (titles != null) {
			for (int i = 0; i < titles.length; i++) {
				if (titles[i] != null && !titles[i].trim().isEmpty()) {
					projects.add(new Project(titles[i],
							projDescriptions != null && i < projDescriptions.length ? projDescriptions[i] : "",
							technologies != null && i < technologies.length ? technologies[i] : "",
							projDurations != null && i < projDurations.length ? projDurations[i] : "",
							githubLinks != null && i < githubLinks.length ? githubLinks[i] : "",
							liveLinks != null && i < liveLinks.length ? liveLinks[i] : ""));
				}
			}
		}
		session.setAttribute("projects", projects);

		// Redirect to portfolio page
		response.sendRedirect("portfolio.jsp");
	}
}
