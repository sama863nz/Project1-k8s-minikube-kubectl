// JavaScript code
document.addEventListener('DOMContentLoaded', function() {
  // Code to be executed when the DOM is ready

  // Example: Display a welcome message
  var name = prompt("Enter your name:");
  if (name) {
    var welcomeMessage = document.getElementById('welcome-message');
    welcomeMessage.textContent = "Welcome, " + name + "!";
  }
  
  // Example: Toggle the visibility of a section
  var toggleButton = document.getElementById('toggle-button');
  var sectionToToggle = document.getElementById('section-to-toggle');
  toggleButton.addEventListener('click', function() {
    sectionToToggle.classList.toggle('hidden');
  });
});
