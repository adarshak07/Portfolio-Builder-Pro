<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.java.Servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portfolio - ${sessionScope.fullName}</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					gray : {
						900 : '#111827',
						800 : '#1f2937',
						700 : '#374151',
						600 : '#4b5563',
						500 : '#6b7280',
						400 : '#9ca3af',
						300 : '#d1d5db'
					}
				}
			}
		}
	}
</script>
<style>
@media print {
	.no-print {
		display: none !important;
	}
	body {
		background: white !important;
		color: black !important;
	}
	.bg-gray-900 {
		background: white !important;
	}
	.bg-gray-800 {
		background: #f9f9f9 !important;
		border: 1px solid #ddd !important;
	}
	.text-white {
		color: black !important;
	}
	.text-gray-300 {
		color: #333 !important;
	}
	.text-gray-400 {
		color: #666 !important;
	}
}
</style>
</head>
<body class="min-h-screen bg-gray-900 text-white py-8">
	<div class="max-w-4xl mx-auto px-4">
		<div class="mb-8 no-print">
			<a href="index.jsp"
				class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-800 transition-colors">
				← Back to Editor </a>
		</div>

		<!-- Header Section -->
		<div class="text-center mb-12">
			<h1 class="text-5xl font-bold mb-4">${sessionScope.fullName}</h1>
			<c:if test="${not empty sessionScope.bio}">
				<p
					class="text-xl text-gray-300 mb-6 max-w-3xl mx-auto leading-relaxed">
					${sessionScope.bio}</p>
			</c:if>

			<div class="flex flex-wrap justify-center gap-4 mb-6">
				<c:if test="${not empty sessionScope.email}">
					<div class="flex items-center gap-2 text-gray-300">
						<span>📧</span> <span>${sessionScope.email}</span>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.phone}">
					<div class="flex items-center gap-2 text-gray-300">
						<span>📞</span> <span>${sessionScope.phone}</span>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.location}">
					<div class="flex items-center gap-2 text-gray-300">
						<span>📍</span> <span>${sessionScope.location}</span>
					</div>
				</c:if>
			</div>

			<div class="flex justify-center gap-4">
				<c:if test="${not empty sessionScope.github}">
					<a href="${sessionScope.github}" target="_blank"
						class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-800 transition-colors">
						🔗 GitHub </a>
				</c:if>
				<c:if test="${not empty sessionScope.linkedin}">
					<a href="${sessionScope.linkedin}" target="_blank"
						class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-800 transition-colors">
						💼 LinkedIn </a>
				</c:if>
				<c:if test="${not empty sessionScope.website}">
					<a href="${sessionScope.website}" target="_blank"
						class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-800 transition-colors">
						🌐 Website </a>
				</c:if>
			</div>
		</div>

		<!-- Skills Section -->
		<c:if test="${not empty sessionScope.skills}">
			<div class="bg-gray-800 border border-gray-700 rounded-lg mb-8">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-2xl font-semibold text-white">Skills</h2>
				</div>
				<div class="p-6">
					<div class="flex flex-wrap gap-2">
						<c:forTokens items="${sessionScope.skills}" delims="," var="skill">
							<span
								class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-600 text-white">
								${fn:trim(skill)} </span>
						</c:forTokens>
					</div>
				</div>
			</div>
		</c:if>

		<!-- Experience Section -->
		<c:set var="experiences" value="${sessionScope.experiences}" />
		<c:if test="${not empty experiences}">
			<div class="bg-gray-800 border border-gray-700 rounded-lg mb-8">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-2xl font-semibold text-white">Experience</h2>
				</div>
				<div class="p-6 space-y-6">
					<c:forEach var="exp" items="${experiences}">
						<div class="border-l-4 border-blue-500 pl-6 pb-6">
							<div
								class="flex flex-col md:flex-row md:justify-between md:items-start mb-2">
								<div>
									<h3 class="text-xl font-semibold text-white">${exp.position}</h3>
									<p class="text-blue-400 font-medium">${exp.company}</p>
								</div>
								<c:if test="${not empty exp.duration}">
									<span class="text-gray-400 text-sm mt-1 md:mt-0">${exp.duration}</span>
								</c:if>
							</div>
							<c:if test="${not empty exp.description}">
								<p class="text-gray-300 leading-relaxed">${exp.description}</p>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>

		<!-- Education Section -->
		<c:set var="educations" value="${sessionScope.educations}" />
		<c:if test="${not empty educations}">
			<div class="bg-gray-800 border border-gray-700 rounded-lg mb-8">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-2xl font-semibold text-white">Education</h2>
				</div>
				<div class="p-6 space-y-6">
					<c:forEach var="edu" items="${educations}">
						<div class="border-l-4 border-green-500 pl-6 pb-6">
							<div
								class="flex flex-col md:flex-row md:justify-between md:items-start mb-2">
								<div>
									<h3 class="text-xl font-semibold text-white">${edu.degree}</h3>
									<p class="text-green-400 font-medium">${edu.institution}</p>
								</div>
								<div class="text-right mt-1 md:mt-0">
									<c:if test="${not empty edu.duration}">
										<span class="text-gray-400 text-sm block">${edu.duration}</span>
									</c:if>
									<c:if test="${not empty edu.grade}">
										<span class="text-gray-300 text-sm block">${edu.grade}</span>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>

		<!-- Projects Section -->
		<c:set var="projects" value="${sessionScope.projects}" />
		<c:if test="${not empty projects}">
			<div class="bg-gray-800 border border-gray-700 rounded-lg mb-8">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-2xl font-semibold text-white">Projects</h2>
				</div>
				<div class="p-6 space-y-8">
					<c:forEach var="project" items="${projects}">
						<div class="bg-gray-700 rounded-lg p-6">
							<div
								class="flex flex-col md:flex-row md:justify-between md:items-start mb-4">
								<h3 class="text-xl font-semibold text-white mb-2">${project.title}</h3>
								<c:if test="${not empty project.duration}">
									<span class="text-gray-400 text-sm">${project.duration}</span>
								</c:if>
							</div>

							<c:if test="${not empty project.description}">
								<p class="text-gray-300 mb-4 leading-relaxed">${project.description}</p>
							</c:if>

							<c:if test="${not empty project.technologies}">
								<div class="mb-4">
									<div class="flex flex-wrap gap-2">
										<c:forTokens items="${project.technologies}" delims=","
											var="tech">
											<span
												class="inline-flex items-center px-2 py-1 rounded text-sm border border-purple-500 text-purple-300">
												${fn:trim(tech)} </span>
										</c:forTokens>
									</div>
								</div>
							</c:if>

							<div class="flex gap-4">
								<c:if test="${not empty project.githubLink}">
									<a href="${project.githubLink}" target="_blank"
										class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-600 transition-colors">
										🔗 Code </a>
								</c:if>
								<c:if test="${not empty project.liveLink}">
									<a href="${project.liveLink}" target="_blank"
										class="inline-flex items-center px-4 py-2 border border-gray-600 text-gray-300 rounded-md hover:bg-gray-600 transition-colors">
										🚀 Live Demo </a>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>

		<div class="text-center mt-12 no-print">
			<button onclick="window.print()"
				class="px-8 py-3 text-lg font-semibold text-white bg-gradient-to-r from-green-600 to-blue-600 rounded-md hover:from-green-700 hover:to-blue-700 transition-colors">
				Export as PDF</button>
		</div>
	</div>
</body>
</html>
>
