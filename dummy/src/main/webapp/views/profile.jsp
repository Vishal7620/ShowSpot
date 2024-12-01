<!doctype html>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Bookings"%>
<%@page import="com.example.realtime.entities.User"%>
<%@page import="com.example.realtime.entities.Shows"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="java.util.List"%>

<%
User currentUser = (User)session.getAttribute("currentUser");
List<Movies>moviesList= (List<Movies>)request.getAttribute("moviesList");
List<Theaters>theaterList=(List<Theaters>)request.getAttribute("theatersList");
List<Bookings>recentBookings=(List<Bookings>)request.getAttribute("recentBookings");
%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" crossorigin="anonymous">

    <title>ShowSpot</title>
    
    <style>
        .form-group input {
            height: 30px; /* Reduces input height */
            padding: 4px 8px; /* Compact padding */
            font-size: 14px; /* Slightly smaller font */
        }
        .btn {
            color: white;
            background-color: #EE4566;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">ShowSpot</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Movies</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <% if (currentUser != null && currentUser.getEmail() != null) { %>
                <h4>Welcome back, <%= currentUser.getEmail().substring(0, 1).toUpperCase() %></h4>
            <% } else { %>
                <h4>Welcome back, Guest</h4>
            <% } %>
        </form>
    </div>
</nav>

<div class="container mt-5">
    <% if (currentUser != null) { %>
        <!-- Row to display Profile and Bookings side by side -->
        <div class="row">
            <!-- User Information Section -->
            <div class="col-md-6">
                <h2>Your Profile</h2>
                <form id="userInfoForm">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" class="form-control" value="<%= currentUser.getFullname() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" value="<%= currentUser.getEmail() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" class="form-control" value="" readonly>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" value="<%= currentUser.getMob() %>" readonly>
                    </div>
                    <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                    <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">Save Changes</button>
                </form>
            </div>

            <!-- Recent Bookings Section -->
            <div class="col-md-6">
                <h3>Recent Bookings</h3>
                <ul class="list-group">
                    <% int i=0;
                    if (recentBookings != null && !recentBookings.isEmpty()) { %>
                        <% for (Bookings booking : recentBookings) { %>
                            <li class="list-group-item">
                                <strong>Movie:</strong> <%= moviesList.get(i).getTitle()%><br>
                                <strong>Theater:</strong> <%= theaterList.get(i).getTheaterName()%><br>
                                <strong>Date:</strong> <%= moviesList.get(i).getReleaseDate()%><br>
                            </li>
                        <% } %>
                    <% } else { %>
                        <li class="list-group-item">No recent bookings available.</li>
                    <% } %>
                </ul>
            </div>
        </div>
    <% } else { %>
        <!-- Login Prompt -->
        <div class="text-center">
            <h3 class="mt-5">Please log in to view your profile and recent bookings.</h3>
            <a href="login.jsp" class="btn btn-primary mt-3">Log In</a>
        </div>
    <% } %>
</div>

<script>
    // JavaScript to enable editing fields
    document.getElementById('editButton').addEventListener('click', function() {
        document.querySelectorAll('#userInfoForm input').forEach(input => input.readOnly = false);
        document.getElementById('saveButton').style.display = 'inline-block';
        this.style.display = 'none';
    });
</script>

<!-- Optional JavaScript; Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>































<%-- <!doctype html>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Bookings"%>
<%@page import="com.example.realtime.entities.User"%>
<%@page import="com.example.realtime.entities.Shows"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="java.util.List"%>

<%
User currentUser = (User)session.getAttribute("currentUser");
List<Movies>moviesList= (List<Movies>)request.getAttribute("moviesList");
List<Theaters>theaterList=(List<Theaters>)request.getAttribute("theatersList");

List<Bookings>recentBookings=(List<Bookings>)request.getAttribute("recentBookings");
%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" crossorigin="anonymous">

    <title>ShowSpot</title>
    
    <style>
        .container {
            max-width: 500px; /* Limits form width */
        }
        .form-group input {
            height: 30px; /* Reduces input height */
            padding: 4px 8px; /* Compact padding */
            font-size: 14px; /* Slightly smaller font */
        }
        .btn {
            color: white;
            background-color: #EE4566;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">ShowSpot</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Movies</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <% if (currentUser != null && currentUser.getEmail() != null) { %>
                <h4>Welcome back, <%= currentUser.getEmail().substring(0, 1).toUpperCase() %></h4>
            <% } else { %>
                <h4>Welcome back, Guest</h4>
            <% } %>
        </form>
    </div>
</nav>

<div class="container mt-5">
    <% if (currentUser != null) { %>
        <!-- User Information Section -->
        <div class="info-section">
            <h2>Your Profile</h2>
            <form id="userInfoForm">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" class="form-control" value="<%= currentUser.getFullname() %>" readonly>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" value="<%= currentUser.getEmail() %>" readonly>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" value="" readonly>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control" value="<%= currentUser.getMob() %>" readonly>
                </div>
                <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">Save Changes</button>
            </form>
        </div>

        <!-- Recent Bookings Section -->
        <div class="info-section mt-4">
            <h3>Recent Bookings</h3>
            <ul class="list-group">
              <% int i=0;
                if (recentBookings != null && !recentBookings.isEmpty()) { %>
                    <% for (Bookings booking : recentBookings) { %>
                        <li class="list-group-item">
                            <strong>Movie:</strong> <%= moviesList.get(i).getTitle()%><br>
                            <strong>Theater:</strong> <%= theaterList.get(i).getTheaterName()%><br>
                            <strong>Date:</strong> <%= moviesList.get(i).getReleaseDate()%><br>
                            <strong>Seats:</strong> <%= booking.getSeats() %> 
                        </li>
                    <% } %>
                <% } else { %>
                    <li class="list-group-item">No recent bookings available.</li>
                <% } %> 
            </ul>
        </div>
    <% } else { %>
        <!-- Login Prompt -->
        <div class="text-center">
            <h3 class="mt-5">Please log in to view your profile and recent bookings.</h3>
            <a href="login.jsp" class="btn btn-primary mt-3">Log In</a>
        </div>
    <% } %>
</div>

<script>
    // JavaScript to enable editing fields
    document.getElementById('editButton').addEventListener('click', function() {
        document.querySelectorAll('#userInfoForm input').forEach(input => input.readOnly = false);
        document.getElementById('saveButton').style.display = 'inline-block';
        this.style.display = 'none';
    });
</script>

<!-- Optional JavaScript; Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
 --%>