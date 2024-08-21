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
          </form>
        </div>
      </nav>
      

  <div class="container mt-5">
    <div class="row align-items-center">
      <div class="col-md-3 ml-3">
        <img src="${pageContext.request.contextPath}/images/<%=movie.getPosterName() %>.jpg" class="custom-img" alt="Movie Poster" style="border-radius: 8px;">
        <h4 class="text-center mt-2">In cinemas</h4>
      </div>
      <div class="col-md-6 mr-4">
        <h3><%= movie.getTitle() %></h3>
        <div class="rating-box">
          <div class="rating-content">
            <div class="star-rating">
              <img src="${pageContext.request.contextPath}">
            </div>
            <div class="rating-text">
              ⭐7/10
            </div>
          </div>
          <button class="btn">Rate Now</button>
        </div>
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
    Bad Newz is a bizarre, rare comedy about heteropaternal superfecundation! A twist of fate leads to Saloni Bagga`s          twin pregnancy being fathered by both Akhil Chadha and Gurbir Pannu, setting off a chaotic rivalry for her love and their children. As Akhil and Gurbir vie for Saloni`s affections, chaos ensues.s
    </p>

    </div>
    
  </div>
  
  

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
