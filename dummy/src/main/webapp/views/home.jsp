<!doctype html>
<%@page import="com.example.realtime.entities.Shows"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
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
        <a class="nav-link" href="#">Sign In</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Sign Out</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn my-2 my-sm-0" type="submit">Search</button>
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
      <h4 id="display-city" class="display-city"></h4>
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
          <img src="${pageContext.request.contextPath}/images/<%=movie.getPosterName() %>.jpg" class="card-img-top" alt="Image 1">
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

  <!-- Code for events -->
  <div class="container mt-5">
    <h3>Outdoor Events</h3>
    <div class="row">
      <% 
      List<Shows> showsList = (List<Shows>) request.getAttribute("shows");
		  String city=(String)request.getAttribute("selectedCity");
		  System.out.println(city);
		  if(showsList!=null)
		  {
      for (Shows show : showsList) {
      %>
      <!-- Card 1 -->
      <div class="col-md-3 mb-3">
        <div class="card">
          <img src="https://via.placeholder.com/350x150" class="card-img-top" alt="Image 1">
          <div class="card-body">
            <h5 class="card-title"><%= show.getName() %></h5>
            <p class="card-text"><%= show.getTime() %></p>
            <p class="card-text"><%= show.getLocation() %></p>
          </div>
        </div>
      </div>
      <% } %>
		  <% }else{
      %>
       <h4>There is no shows available at this city</h4>
     <% } %>
    </div>
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
                </select>
            </div>
        </div>
       
        
        <!-- Placeholder for selected city -->
        <div id="selected-city" class="mt-3"></div>
        
        <button id="close-popup" class="btn btn-secondary mt-3">Select</button>
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

    loadCityBtn.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent the default button action
        popup.style.display = 'flex'; // Show the popup
        console.log('Popup opened');
    });

    closePopupBtn.addEventListener('click', function() {
        const selectedCity = selectCity.value;
        hiddenCity.value = selectedCity;
        displayCity.textContent = selectedCity;
        popup.style.display = 'none'; // Hide the popup
        console.log('Popup closed with city:', selectedCity);
    });

    // Optional: Filter city list based on search input
    const citySearch = document.getElementById('city-search');
    citySearch.addEventListener('input', function() {
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
});
</script>

<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
-->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</body>
</html>
