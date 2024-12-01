<%@page import="com.example.realtime.entities.User"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="com.example.realtime.services.MoviesService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String movieIdParam=request.getParameter("movieId");
long movieId=Long.parseLong(movieIdParam);
Movies movie=(Movies)request.getAttribute("movie");
long time=movie.getDuration();
long hour =0;
long minute=0;

	hour=time/60;
	if(time%60>0)
		minute=time%60;
String date=(String)request.getAttribute("formattedDate");
User currentUser=(User)session.getAttribute("currentUser");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie Card</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .custom-img {
      max-width: 100%;
      height: 400px;
    }
    .rating-box {
      border: 2px solid black;
      border-radius: 8px;
      padding: 10px;
      margin-top: 15px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: #f8f9fa;
    }
    .rating-content {
      display: flex;
      align-items: center;
    }
    .star-rating {
      font-size: 1.5rem;
      color: gold;
    }
    .rating-text {
      font-size: 1.2rem;
      color: #333;
      margin-left: 5px; /* Reduced margin between the star and the rating number */
    }
     .btn
    {
     color: white;
     background-color: #EE4566;
    }
    .btn:hover
    {
    color:white;
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
    
     .card-title {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 100%; /* Adjust based on your card layout */
  }

  .card-text {
    white-space: nowrap; /* Optional: prevents genre from wrapping */
    overflow: hidden;
    text-overflow: ellipsis;
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
      

  <div class="container mt-5">
    <div class="row align-items-center">
      <div class="col-md-3 ml-3">
        <img src="${pageContext.request.contextPath}/images/<%=movie.getPosterName()%>" class="custom-img" alt="Movie Poster" style="border-radius: 8px;">
        <h4 class="text-center mt-2">In cinemas</h4>
      </div>
      <div class="col-md-6 mr-4">
        <h3><%= movie.getTitle() %></h3>
       <%--  <div class="rating-box">
          <div class="rating-content">
            <div class="star-rating">
              <img src="${pageContext.request.contextPath}">
            </div>
            <div class="rating-text">
              ⭐7/10
            </div>
          </div>
          <button class="btn">Rate Now</button>
        </div> --%>
        <div class="row align-items ml-3 mt-2">
        <div class="mr-3">
            <h5>2D</h5>
        </div>
        <div>
            <h5><%= movie.getLanguage() %></h5>
        </div>
        </div>

        <div class="row align-items ml-3 mt-2">
            <div class="mr-2">
                <h6><%=hour %>h <%=minute%>m | </h6>
            </div>
            <div class="mr-2">
                <h6> <%=movie.getGenre() %> | </h6>
            </div>
            <div class="mr-2">
                <h6> UA | </h6>
            </div>
            <div class="mr-2">
                <h6> <%=date %></h6>
            </div>
            </div>

       <a href="/views/selectTheater?movieId=<%=movieId%>&city=<%=movie.getLoaction()%>"> <button class="btn mt-3">Book Tickets</button> </a>
      </div>
    </div>
    
    <div class="row mt-3 ml-3 col-md-10">
    <h3>About Movie</h3>
    
    <p>
    <%=movie.getAbout()%>
    </p>

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

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
