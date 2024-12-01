<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.example.realtime.entities.TheaterTimmings"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="java.util.List"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    Movies movie= (Movies)request.getAttribute("movie");
    String city=(String) request.getAttribute("city");
    
    Set<Theaters> theaters=(Set<Theaters>)request.getAttribute("theaters");
    Map<String,List<String>> map=(Map<String,List<String>>)request.getAttribute("theater-timing");
    List<Long>id=(List<Long>)request.getAttribute("theaterId");
      Long i=0L;
	  int idx=i.intValue();
    %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>ShowSpot</title>
    
    <!-- logos cdn of social media -->
    <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    
    <style>
    .btn {
        color: white;
        background-color: #EE4566;
    }
    hr {
        border: 0;
        height: 1px;
        background: #ddd;
        margin: 20px 0;
    }
    .timming {
        padding-left: 12px;
        padding-right: 12px; 
        padding-top: 6px;
        padding-bottom: 6px;
        border: 1px solid gray; /* Corrected from 'boarder' to 'border' */
        border-radius: 4px;
        color: #90EE90;
        background-color: white;
    }
     .timing-row {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            gap: 10px; /* Space between buttons */
        }
    .small-text {
        font-size: 0.8rem; /* Adjust the size as needed */
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
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Movies</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Sign In</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Sign Out</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<!-- Theater Upper part -->

<div class="container mt-3">
  <div class="row">
    <div class="col-md-10">
      <h3><%=movie.getTitle() %> - <%=movie.getLanguage() %></h3>
    </div>
  </div>
  <hr>
  <div class="row mt-3">
  <%
  
  Date date=new Date();
  SimpleDateFormat sdf=new SimpleDateFormat("dd MMM yyyy");
  String formatteddate1=sdf.format(date);
  
  Calendar calendar = Calendar.getInstance();
  calendar.add(Calendar.DAY_OF_MONTH, 1);
  Date tomorrow = calendar.getTime();
  
  String formatteddate2=sdf.format(tomorrow);
  
  Calendar calendar2=Calendar.getInstance();
  calendar2.add(Calendar.DAY_OF_MONTH,2);
  Date dayAfterTomorrow=calendar2.getTime();
  
  String formatteddate3=sdf.format(dayAfterTomorrow);
  
  %>
  
   <a href="/views/selectTheater?movieId=<%=movie.getId()%>&city=<%=city%>"> 
   <button class="btn"><%=formatteddate1 %></button>
   </a>
  </div>
</div>

<!-- Theater List -->

<div class="container mt-5">
  <!-- First Row -->
  
  <%
 
  if(theaters!=null)
  {
	  
  for(Theaters theater:theaters)
  {
	  String theaterName=theater.getTheaterName();
	  List<String>timings=map.get(theaterName);
	  
  %>
  <div class="row mb-3">
    <div class="col-12">
      <h6><%=theater.getTheaterName() %>: <%=theater.getAddress() %></h6>
    </div>
  </div>
  <div class="timing-row">
     <%
     if(timings!=null)
     {
    	 for(String timing:timings)
    	 {
    		 
     %>
     <a href="/views/seatLayout?movieId=<%=movie.getId()%>&city=<%=city%>&theaterId=<%=id.get(idx)%>&timming=<%=timing%>&date=<%=formatteddate1%>"> 
     <button class="timming"><%= timing%></button>
     </a>

  <%
  idx++;
    	 }
  }
  else
  {
  %>
     <div class="col-8">
            <p>No timings available</p>
          </div>
<%
}
%>  
   </div>
  <hr class="gray-line">
  <%
  }
  }
  else
  {
  %>
 <h1>Something went wrong!</h1>
 <%
  }
 %>


</div>




<!-- footer part -->

<footer class="bg-dark text-white text-center py-4">
  <div class="container">
    <!-- ShowSpot Text -->
    <h4 class="mb-3">ShowSpot</h4>
    
    <!-- Social Media Icons -->
    <div class="mb-3">
      <a href="https://facebook.com" class="text-white mx-2" target="_blank">
        <i class="fab fa-facebook-f fa-2x"></i>
      </a>
      <a href="https://twitter.com" class="text-white mx-2" target="_blank">
        <i class="fab fa-twitter fa-2x"></i>
      </a>
      <a href="https://instagram.com" class="text-white mx-2" target="_blank">
        <i class="fab fa-instagram fa-2x"></i>
      </a>
      <a href="https://youtube.com" class="text-white mx-2" target="_blank">
        <i class="fab fa-youtube fa-2x"></i>
      </a>
      <a href="https://linkedin.com" class="text-white mx-2" target="_blank">
        <i class="fab fa-linkedin-in fa-2x"></i>
      </a>
    </div>
  </div>
</footer>

<!-- Optional JavaScript; choose one of the two! -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


<!-- logos cdn -->

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
