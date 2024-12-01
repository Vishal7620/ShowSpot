<%@page import="com.example.realtime.entities.User"%>
<%@page import="com.example.realtime.entities.Shows"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<%

String city=(String)request.getAttribute("selectedCity");
User currentUser=(User)session.getAttribute("currentUser");
%>

<meta charset="ISO-8859-1">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>ShowSpot</title>
    
    <style>
    .card {
      height: 400px;
    }
    .card-img-top {
      height: 80%;
      object-fit: cover;
    }
    .card-body {
      height: 20%;
      overflow: hidden;
    }
    .card-title, .card-text {
      color: black;
    }
    .btn {
      color: white;
      background-color: #EE4566;
    }
    .btn:hover {
      color: white;
    }
    .popup {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
    }
    .popup-content {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      text-align: center;
      width: 600px;
      max-width: 90%;
    }
    .popup-content input[type="text"] {
      width: 100%;
      margin-bottom: 20px;
    }
    #city-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }
    .city-item {
      text-decoration: none;
      color: black;
      text-align: center;
      margin: 10px;
      flex: 1 1 150px;
    }
    .city-icon {
      font-size: 100px;
      margin-bottom: 5px;
    }
    .city-item p {
      margin: 0;
    }
    .city-item:hover {
      color: #EE4566;
    }
    .popup-content .btn {
      margin: 5px;
    }    
    </style>

<title>Insert title here</title>
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
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Movies</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/views/profile">Profile</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <!-- <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
      <!-- <button class="btn my-2 my-sm-0" type="submit">Search</button> -->
      <% if (currentUser != null && currentUser.getEmail() != null) { %>
      <h4>Welcome back, <%= currentUser.getEmail().substring(0, 1).toUpperCase() %></h4>
      <% } else { %>
     <h3>Welcome back, Guest</h3>
      <% } %>

       <button id="load-city" class="btn ml-2">Select City</button>
    </form>
  </div>
</nav>

<!-- Code for movies -->
<div class="container mt-5">
  <div class="row align-items-center">
    <h3 class="col-md-6">Recommended Movies</h3>
    <input type="hidden" id="hidden-city" name="hidden-city">
    <div class="col-md-6 text-right">
      <h4 id="display-city" class="display-city"><%= city%></h4>
    </div>
  </div>
  <div class="row">
    <% 
    List<Movies> movies = (List<Movies>) request.getAttribute("movies");
    for (Movies movie : movies) {
    %>
    <!-- Card 1 -->
    <div class="col-md-3 mb-3">
      <a href="/views/selectedMovie?movieId=<%= movie.getId() %>" class="text-decoration-none movie-card" data-movie-id="<%= movie.getId() %>">
        <div class="card">
          <img src="${pageContext.request.contextPath}/images/<%=movie.getPosterName() %>" class="card-img-top" alt="Image 1">
          <div class="card-body">
            <h5 class="card-title"><%=movie.getTitle()%></h5>
            <p class="card-text"><%= movie.getGenre()%></p>
          </div>
        </div>
      </a>
    </div>
    <% 
    }
    %>
  </div>

</div>

<!-- Select city popup window -->
<div id="myPopup" class="popup">
    <div class="popup-content">
        <h4>Select a City</h4>
        
        <!-- Search bar -->
        <input type="text" id="city-search" class="form-control mb-3" placeholder="Search for a city">
        
        <!-- Cities list -->
        <form action="/views/selectedMovie" method="post">
        <div id="city-list">
            <div class="form-group">
                <label for="select-city">Select a City:</label>
                <select id="select-city" name="city" class="form-control">
                    <option value="">-- Choose a city --</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Pune">Pune</option>
                    <option value="Bengaluru">Bengaluru</option>
                    <option value="Punjab">Punjab</option>
                </select>
            </div>
        </div>
       
        
        <!-- Placeholder for selected city -->
        <div id="selected-city" class="mt-3"></div>
        
      <button id="close-popup" class="btn btn-secondary mt-3">Select</button>
      
      <button type="button" id="cancel-button" class="btn btn-secondary mt-3">Cancel</button>
         </form>
    </div>
</div>

<!-- Search content using city -->
<script>

 document.addEventListener('DOMContentLoaded', function() {
    const popup = document.getElementById('myPopup');
    const loadCityBtn = document.getElementById('load-city');
    const closePopupBtn = document.getElementById('close-popup');
    const selectCity = document.getElementById('select-city');
    const hiddenCity = document.getElementById('hidden-city');
    const displayCity = document.getElementById('display-city');
    const cancelBtn = document.getElementById('cancel-button');
    
    if (loadCityBtn) {
        loadCityBtn.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent default button action
            if (popup) {
                popup.style.display = 'flex'; // Show the popup
                console.log('Popup opened');
            }
        });
    }
    
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function () {
            if (popup) {
                popup.style.display = 'none'; // Hide the popup
                console.log('Popup closed via Cancel button');
            }
        });
    }

    // Optional: Filter city list based on search input
     if (citySearch) {
        citySearch.addEventListener('input', function () {
            const searchTerm = this.value.toLowerCase();
            const options = selectCity.querySelectorAll('option');
            options.forEach(option => {
                if (option.textContent.toLowerCase().includes(searchTerm)) {
                    option.style.display = 'block';
                } else {
                    option.style.display = 'none';
                }
            });
        });
    }
    
     if (closePopupBtn) {
         closePopupBtn.addEventListener('click', function (event) {
             event.preventDefault(); // Prevent default button action
             if (popup) {
                 popup.style.display = 'none'; // Hide the popup
                 console.log('Popup closed via Select button');
             }
         });
     }
    
});
</script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</body>
</html>