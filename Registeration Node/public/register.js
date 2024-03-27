
function validateForm() {
  var username = document.getElementById('username').value.trim();
  var email = document.getElementById('email').value.trim();
  var password = document.getElementById('password').value;
  var confirm_password = document.getElementById('confirm_password').value;

  // Check if username is empty
  if (username === "") {
    alert("Please enter your username.");
    return false;
  }

  // Check if email is empty
  if (email === "") {
    alert("Please enter your email.");
    return false;
  }

  // Check if email is valid
  var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
  if (!emailRegex.test(email)) {
    alert("Please enter a valid email address.");
    return false;
  }

  // Check if password is empty
  if (password === "") {
    alert("Please enter your password.");
    return false;
  }

  // Check if confirm password is empty
  if (confirm_password === "") {
    alert("Please confirm your password.");
    return false;
  }

  // Check if password and confirm password match
  if (password !== confirm_password) {
    alert("Password and confirm password do not match.");
    return false;
  }

  // If all validations pass, redirect to index.html
  redirectToIndex();
  return false;
}

function redirectToIndex() {
  // Redirect to index.html
  window.location.href = "index.html"; // Use a relative path
}
