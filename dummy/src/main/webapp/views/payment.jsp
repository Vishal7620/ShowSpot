<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="com.example.realtime.entities.Seats"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 List<Seats> bookedSeats = (List<Seats>) request.getAttribute("bookedSeats");
Movies movie=(Movies)request.getAttribute("movieId");
Theaters theater=(Theaters)request.getAttribute("theaterId");
float subTotal = 0;
 float size = bookedSeats.size();
float charges = 12 * size;
for (Seats seat : bookedSeats) {
    subTotal += seat.getPrice();
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment and Order Summary</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    .btn {
        color: #EE4566;
        background-color: white;
        border: 1px solid #EE4566;
    }
    .btn:hover {
        color: white;
        background-color: #EE4566;
    }
    .payment {
        color: white;
        background-color: #EE4566;
    }
    .amount-payable {
        background-color: #f5f5dc;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
    }
    .gray-line {
        border-top: 1px solid gray;
        margin: 10px 0;
    }
</style>
</head>
<body>
<div class="container mt-4">
    <div class="row">
        <!-- Payment Details Section -->
        <div class="col-md-8">
            <h2>Payment Details</h2>
            <div class="card">
                <div class="card-header payment">
                    Share your Contact Details
                </div>
                <form action="/submitPayment?movieId=<%=movie.getId()%>&theaterId=<%=theater.getTheaterId()%>&amount=<%=subTotal+charges%>" method="POST">
                    <div class="card-body">
                        <div class="row">
                            <!-- Full Name Input -->
                            <div class="col-md-6 mb-3">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter full name" required>
                            </div>

                            <!-- Email Input -->
                            <div class="col-md-6 mb-3">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
                            </div>
                               
                             <!-- hidden field for current time -->  
                               
                             <input type="hidden" id="currentDate" name="currentDate">
                               
                            <!-- Contact Number Input -->
                            <div class="col-md-6 mb-3">
                                <label for="contact">Contact Number</label>
                                <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter contact number" required>
                            </div>

                            <!-- Amount Input -->
                            <div class="col-md-6 mb-3">
                                <label for="amount">Amount</label>
                                <input class="form-control" id="amount" name="amount" placeholder="<%=subTotal+charges%>" readonly>
                            </div>
                        </div>
                         
                       <!-- Hidden fields to send the booked seats -->  
                         
                        <% for (Seats seat : bookedSeats) { %>
                       <input type="hidden" name="bookedSeatIds[]" value="<%= seat.getSeatId() %>">
                        <% } %>

                        <!-- Pay Button -->
                        <div class="row">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success btn-block">Pay</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Order Summary Section -->
        <div class="col-md-4">
            <h2>Order Summary</h2>
            <p>Seat Information:</p>
            <ul>
                <% for (Seats seat : bookedSeats) { %>
                    <li><%= seat.getSeatNumber() %></li>
                <% } %>
            </ul>
            <p>Tickets Price: <%= subTotal %></p>
            <p>Convenience Fees: <%= charges %></p>
            <div class="gray-line"></div>
            <div class="amount-payable">
                <h5>Subtotal Amount Payable</h5>
                <p><span id="totalAmountPayable"><%= subTotal + charges %></span></p>
            </div>
        </div>
    </div>
</div>

<script>

document.addEventListner("DOMContentLoaded", function(){
	
	 var currentDate = new Date().toISOString().split("T")[0];
	    document.getElementById("currentDate").value = currentDate;
})

</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

