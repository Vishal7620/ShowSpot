<%@page import="com.example.realtime.entities.Bookings"%>
<%@page import="com.example.realtime.entities.Seats"%>
<%@page import="java.util.List"%>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%
    Movies movie=(Movies)request.getAttribute("movie");
    Theaters theaters=(Theaters)request.getAttribute("theater");
    long amount=(long)request.getAttribute("amount");
    List<Seats>seatList=(List<Seats>)request.getAttribute("bookedSeats");
    Bookings bookings=(Bookings)request.getAttribute("bookings");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Success</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .success-container {
            margin-top: 50px;
            text-align: center;
        }
        .emoji {
            font-size: 4rem;
        }
        .confirmation-message {
            font-size: 1.5rem;
            margin: 20px 0;
        }
        .btn-middle {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>

 <div class="container success-container">
        <!-- Success Emoji and Message -->
        <div class="row">
            <div class="col-md-12">
                <span class="emoji">🎉🎟️</span>
                <h1 class="confirmation-message">Seats Booked Successfully!</h1>
                <p>Your booking is confirmed! We hope you enjoy your movie 🎬🍿</p>
            </div>
        </div>

        <!-- Booking Details -->
        <div class="row">
            <div class="col-md-12">
                <p><strong>Movie:</strong> <%= movie.getTitle() %></p>
                <p><strong>Theater:</strong> <%= theaters.getTheaterName() %></p>
                <p>  <%=theaters.getAddress() %></p>
                <p><strong>Seats:</strong> 
                   <% for(int i = 0; i < seatList.size(); i++) { 
                   Seats seat = seatList.get(i); %>
                   <%= seat.getSeatNumber() %><% if (i < seatList.size() - 1) { %>, <% } %>
                   <% } %>
                 </p> 
                 <p><strong>Amount Paid:</strong> ₹<%= bookings.getAmount() %></p>
            </div>
        </div>

        <!-- Button in the Middle -->
        <div class="row btn-middle">
            <div class="col-md-12">
                <a href="/views/home" class="btn btn-primary btn-lg">Go to Home 🏠</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>