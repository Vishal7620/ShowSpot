<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.example.realtime.entities.Seats"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

Movies movie=(Movies)request.getAttribute("movieId");
Theaters theater=(Theaters)request.getAttribute("theaterId");

List<Seats>bookedSeats=(List<Seats>)request.getAttribute("bookedSeats");
 
float subTotal=0;
float size=bookedSeats.size();
float charges=12*size;
for(Seats seat:bookedSeats)
{
	subTotal+=seat.getPrice();
}
%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webpage Layout</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

.btn {
        color: #EE4566;
        background-color: white;
        border: 1px solid #EE4566;
    }
    .btn:hover
    {
      color: white;
      background-color: #EE4566;
    }
        .card img {
            width: 120px;
            height: 152px;
        }
        .amount-payable {
            background-color: #f5f5dc; /* Cream color */
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .gray-line {
            border-top: 1px solid gray;
            margin: 10px 0;
        }
        .booking-summary-button {
            width: 100%; /* Make button take full width */
            display: flex;
            justify-content: space-between; /* Space out text and right-aligned content */
            align-items: center; /* Center content vertically */
            padding: 0.5rem; /* Add some padding inside button */
            color: white;
            background-color: #EE4566;
        }
        .proceed-text {
            margin-left: auto; /* Push 'Proceed' text to the right */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <!-- Grab Bite Section -->
            <div class="col-md-8">
                <h2>Grab Bite</h2>
                <div class="row">
                   
                   
             <div class="col-md-6 mb-4">
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="/images/pizza.jpg" class="card-img" alt="Food 1">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Pizza</h5>
                            <p class="card-text">180 Rs</p>
                            <!-- Add button -->
                            <button class="btn btn-primary add-food" data-price="180">Add</button>
                            <!-- Quantity Controls (Initially hidden) -->
                            <div class="quantity-controls d-none">
                                <button class="btn btn-outline-secondary minus-food">-</button>
                                <span class="food-quantity">1</span>
                                <button class="btn btn-outline-secondary plus-food">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
                
                            <div class="col-md-6 mb-4">
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="/images/burger.jpg" class="card-img" alt="Food 1">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Burger</h5>
                            <p class="card-text">120 Rs</p>
                            <!-- Add button -->
                            <button class="btn btn-primary add-food" data-price="120">Add</button>
                            <!-- Quantity Controls (Initially hidden) -->
                            <div class="quantity-controls d-none">
                                <button class="btn btn-outline-secondary minus-food">-</button>
                                <span class="food-quantity">1</span>
                                <button class="btn btn-outline-secondary plus-food">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
                    <div class="col-md-6 mb-4">
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="/images/fries.jpg" class="card-img" alt="Food 1">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">French Fries</h5>
                            <p class="card-text">80 Rs</p>
                            <!-- Add button -->
                            <button class="btn btn-primary add-food" data-price="80">Add</button>
                            <!-- Quantity Controls (Initially hidden) -->
                            <div class="quantity-controls d-none">
                                <button class="btn btn-outline-secondary minus-food">-</button>
                                <span class="food-quantity">1</span>
                                <button class="btn btn-outline-secondary plus-food">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                    <div class="col-md-6 mb-4">
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="/images/coke.jpg" class="card-img" alt="Food 1">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Coke</h5>
                            <p class="card-text">110 Rs</p>
                            <!-- Add button -->
                            <button class="btn btn-primary add-food" data-price="110">Add</button>
                            <!-- Quantity Controls (Initially hidden) -->
                            <div class="quantity-controls d-none">
                                <button class="btn btn-outline-secondary minus-food">-</button>
                                <span class="food-quantity">1</span>
                                <button class="btn btn-outline-secondary plus-food">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
                </div>
            </div>

            <!-- Booking Summary Section -->
            <div class="col-md-4">
                <h2>Booking Summary</h2>
                <p>Seat Information:</p>
                <ul>
                <%for(Seats seat:bookedSeats){ %>
                    <li><%= seat.getSeatNumber() %></li>
                 <%} %>
                 </ul>
                 <p>Tickets Price: <%=subTotal %></p>
                <p>Convience Fees: <%= charges %></p>
                <div class="gray-line"></div>
                <div class="amount-payable">
                    <h5>Subtotal Amount Payable</h5>
                    <p>$<span id="totalAmountPayable"><%=subTotal+charges%></span></p>
                </div>
                
                
                
                   <form action="<%=request.getContextPath()%>/payment?movieId=<%=movie.getId()%>&theaterId=<%=theater.getTheaterId()%>&subTotal=<%=subTotal+charges%>" method="POST">
                <input type="hidden" name="bookedSeats" value="<%= bookedSeats.stream().map(seat -> seat.getSeatId().toString()).collect(Collectors.joining(",")) %>">
                <button type="submit" class="btn booking-summary-button">
                    <span>Total Rs.<span id="totalAmountButton"><%= subTotal + charges %></span></span>
                    <span class="proceed-text">Proceed</span>
                </button>
                 </form>
         
            </div>
        </div>
    </div>

<script>
document.querySelectorAll('.add-food').forEach(function(button) {
    button.addEventListener('click', function() {
        var foodPrice = parseFloat(this.getAttribute('data-price'));

        // Select both totalAmountPayable and totalAmountButton elements
        var totalAmountPayableElement = document.getElementById('totalAmountPayable');
        var totalAmountButtonElement = document.getElementById('totalAmountButton');

        // Get current total values from both the payable section and the button
        var currentTotalPayable = parseFloat(totalAmountPayableElement.innerText);
        var currentTotalButton = parseFloat(totalAmountButtonElement.innerText);

        // Update both totals
        currentTotalPayable += foodPrice;
        currentTotalButton += foodPrice;

        // Update the displayed total in both elements
        totalAmountPayableElement.innerText = currentTotalPayable.toFixed(2);
        totalAmountButtonElement.innerText = currentTotalButton.toFixed(2);

        // Hide "Add" button and show quantity controls
        var cardBody = this.parentNode;
        var quantityControls = cardBody.querySelector('.quantity-controls');
        var foodQuantityElement = quantityControls.querySelector('.food-quantity');

        // Hide Add button and show quantity controls
        this.classList.add('d-none');
        quantityControls.classList.remove('d-none');

        // Initialize quantity
        var currentQuantity = 1;
        foodQuantityElement.innerText = currentQuantity;

        // Event listener for plus button
        quantityControls.querySelector('.plus-food').addEventListener('click', function() {
            currentQuantity++;
            foodQuantityElement.innerText = currentQuantity;

            // Update total when quantity is incremented
            currentTotalPayable += foodPrice;
            currentTotalButton += foodPrice;

            // Update the displayed total in both elements
            totalAmountPayableElement.innerText = currentTotalPayable.toFixed(2);
            totalAmountButtonElement.innerText = currentTotalButton.toFixed(2);
        });

        // Event listener for minus button
        quantityControls.querySelector('.minus-food').addEventListener('click', function() {
            if (currentQuantity > 0) {
                currentQuantity--;
                foodQuantityElement.innerText = currentQuantity;

                // Update total when quantity is decremented
                currentTotalPayable -= foodPrice;
                currentTotalButton -= foodPrice;

                // Update the displayed total in both elements
                totalAmountPayableElement.innerText = currentTotalPayable.toFixed(2);
                totalAmountButtonElement.innerText = currentTotalButton.toFixed(2);
            }
        });
    });
});
</script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
