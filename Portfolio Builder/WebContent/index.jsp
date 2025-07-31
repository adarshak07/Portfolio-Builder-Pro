<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portfolio Builder Pro</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        gray: {
                            900: '#111827',
                            800: '#1f2937',
                            700: '#374151',
                            600: '#4b5563',
                            500: '#6b7280',
                            400: '#9ca3af',
                            300: '#d1d5db'
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="min-h-screen bg-gray-900 text-white py-8">
	<div class="max-w-4xl mx-auto px-4">
		<div class="text-center mb-8">
			<h1 class="text-4xl font-bold mb-2">Portfolio Builder Pro</h1>
			<p class="text-gray-400 text-lg">Create your professional
				portfolio with advanced features</p>
		</div>

		<form action="submitPortfolio" method="post" class="space-y-8">
			<!-- Personal Information -->
			<div class="bg-gray-800 border border-gray-700 rounded-lg">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-xl font-semibold text-white">Personal
						Information</h2>
				</div>
				<div class="p-6 space-y-4">
					<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
						<input type="text" name="fullName" placeholder="Full Name"
							required
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
						<input type="email" name="email" placeholder="Email" required
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
						<input type="tel" name="phone" placeholder="Phone"
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
						<input type="text" name="location" placeholder="Location"
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
					</div>
					<textarea name="bio" placeholder="Bio" rows="4"
						class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
					<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
						<input type="url" name="github" placeholder="GitHub URL"
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
						<input type="url" name="linkedin" placeholder="LinkedIn URL"
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
						<input type="url" name="website" placeholder="Website URL"
							class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
					</div>
				</div>
			</div>

			<!-- Skills -->
			<div class="bg-gray-800 border border-gray-700 rounded-lg">
				<div class="p-6 border-b border-gray-700">
					<h2 class="text-xl font-semibold text-white">Skills</h2>
				</div>
				<div class="p-6">
					<input type="text" name="skills"
						placeholder="Enter skills separated by commas (e.g., JavaScript, React, Node.js)"
						class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
				</div>
			</div>

			<!-- Experience -->
			<div class="bg-gray-800 border border-gray-700 rounded-lg">
				<div
					class="p-6 border-b border-gray-700 flex justify-between items-center">
					<h2 class="text-xl font-semibold text-white">Experience</h2>
					<button type="button" onclick="addExperience()"
						class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
						+ Add Experience</button>
				</div>
				<div class="p-6">
					<div id="experienceContainer">
						<div
							class="experience-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4">
							<div class="flex justify-between items-center">
								<h4 class="text-lg font-medium">Experience 1</h4>
							</div>
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<input type="text" name="position" placeholder="Position"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
								<input type="text" name="company" placeholder="Company"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
							</div>
							<input type="text" name="expDuration"
								placeholder="Duration (e.g., Jan 2020 - Dec 2022)"
								class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
							<textarea name="expDescription" placeholder="Description"
								rows="3"
								class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
						</div>
					</div>
				</div>
			</div>

			<!-- Education -->
			<div class="bg-gray-800 border border-gray-700 rounded-lg">
				<div
					class="p-6 border-b border-gray-700 flex justify-between items-center">
					<h2 class="text-xl font-semibold text-white">Education</h2>
					<button type="button" onclick="addEducation()"
						class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500">
						+ Add Education</button>
				</div>
				<div class="p-6">
					<div id="educationContainer">
						<div
							class="education-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4">
							<div class="flex justify-between items-center">
								<h4 class="text-lg font-medium">Education 1</h4>
							</div>
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<input type="text" name="degree" placeholder="Degree"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
								<input type="text" name="institution" placeholder="Institution"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
							</div>
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<input type="text" name="eduDuration"
									placeholder="Duration (e.g., 2018 - 2022)"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
								<input type="text" name="grade" placeholder="Grade/GPA"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Projects -->
			<div class="bg-gray-800 border border-gray-700 rounded-lg">
				<div
					class="p-6 border-b border-gray-700 flex justify-between items-center">
					<h2 class="text-xl font-semibold text-white">Projects</h2>
					<button type="button" onclick="addProject()"
						class="px-4 py-2 bg-purple-600 text-white rounded-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500">
						+ Add Project</button>
				</div>
				<div class="p-6">
					<div id="projectContainer">
						<div
							class="project-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4">
							<div class="flex justify-between items-center">
								<h4 class="text-lg font-medium">Project 1</h4>
							</div>
							<input type="text" name="projectTitle"
								placeholder="Project Title"
								class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
							<textarea name="projectDescription"
								placeholder="Project Description" rows="3"
								class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500"></textarea>
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<input type="text" name="technologies"
									placeholder="Technologies Used"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
								<input type="text" name="projectDuration" placeholder="Duration"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
							</div>
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<input type="url" name="githubLink" placeholder="GitHub Link"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
								<input type="url" name="liveLink" placeholder="Live Demo Link"
									class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="text-center">
				<button type="submit"
					class="px-8 py-3 text-lg font-semibold text-white bg-gradient-to-r from-blue-600 to-purple-600 rounded-md hover:from-blue-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
					Generate Portfolio</button>
			</div>
		</form>
	</div>

	<script>
        let experienceCount = 1;
        let educationCount = 1;
        let projectCount = 1;

        function addExperience() {
            experienceCount++;
            const container = document.getElementById('experienceContainer');
            const newExperience = document.createElement('div');
            newExperience.className = 'experience-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4';
            newExperience.innerHTML = `
                <div class="flex justify-between items-center">
                    <h4 class="text-lg font-medium">Experience ${experienceCount}</h4>
                    <button type="button" onclick="removeExperience(this)" 
                            class="px-3 py-1 bg-red-600 text-white rounded-md hover:bg-red-700 text-sm">
                        Remove
                    </button>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="text" name="position" placeholder="Position"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <input type="text" name="company" placeholder="Company"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <input type="text" name="expDuration" placeholder="Duration (e.g., Jan 2020 - Dec 2022)"
                       class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <textarea name="expDescription" placeholder="Description" rows="3"
                          class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
            `;
            container.appendChild(newExperience);
        }

        function removeExperience(button) {
            button.closest('.experience-item').remove();
        }

        function addEducation() {
            educationCount++;
            const container = document.getElementById('educationContainer');
            const newEducation = document.createElement('div');
            newEducation.className = 'education-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4';
            newEducation.innerHTML = `
                <div class="flex justify-between items-center">
                    <h4 class="text-lg font-medium">Education ${educationCount}</h4>
                    <button type="button" onclick="removeEducation(this)" 
                            class="px-3 py-1 bg-red-600 text-white rounded-md hover:bg-red-700 text-sm">
                        Remove
                    </button>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="text" name="degree" placeholder="Degree"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" name="institution" placeholder="Institution"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="text" name="eduDuration" placeholder="Duration (e.g., 2018 - 2022)"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" name="grade" placeholder="Grade/GPA"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
            `;
            container.appendChild(newEducation);
        }

        function removeEducation(button) {
            button.closest('.education-item').remove();
        }

        function addProject() {
            projectCount++;
            const container = document.getElementById('projectContainer');
            const newProject = document.createElement('div');
            newProject.className = 'project-item p-4 bg-gray-700 rounded-lg space-y-4 mb-4';
            newProject.innerHTML = `
                <div class="flex justify-between items-center">
                    <h4 class="text-lg font-medium">Project ${projectCount}</h4>
                    <button type="button" onclick="removeProject(this)" 
                            class="px-3 py-1 bg-red-600 text-white rounded-md hover:bg-red-700 text-sm">
                        Remove
                    </button>
                </div>
                <input type="text" name="projectTitle" placeholder="Project Title"
                       class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
                <textarea name="projectDescription" placeholder="Project Description" rows="3"
                          class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500"></textarea>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="text" name="technologies" placeholder="Technologies Used"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
                    <input type="text" name="projectDuration" placeholder="Duration"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="url" name="githubLink" placeholder="GitHub Link"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
                    <input type="url" name="liveLink" placeholder="Live Demo Link"
                           class="w-full px-3 py-2 bg-gray-600 border border-gray-500 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500">
                </div>
            `;
            container.appendChild(newProject);
        }

        function removeProject(button) {
            button.closest('.project-item').remove();
        }
    </script>
</body>
</html>