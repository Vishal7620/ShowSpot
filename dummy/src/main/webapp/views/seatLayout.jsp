<%@page import="com.example.realtime.entities.seats_layout"%>
<%@page import="java.util.List"%>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    Movies movie=(Movies)request.getAttribute("movie");
    Theaters theater=(Theaters)request.getAttribute("theater");
    String date=(String)request.getAttribute("date");
    String timming=(String)request.getAttribute("timming");
    
    %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
    
    
     <style>
   .upper-part {
      position: sticky;
      top: 0;
      background-color: #ffffff; /* White background to match the content area */
      z-index: 1020; /* Ensure it stays above other content */
      padding: 1rem; /* Add padding if needed */
      border-bottom: 1px solid #ddd; /* Optional: Add a border for visual separation */
    }
    .small-text {
      font-size: 0.875rem; /* Adjust font size if needed */
      margin-bottom: 0; /* Remove bottom margin to reduce spacing */
    }
    
    .seat {
      width: 30px;
      height: 30px;
      margin: 5px;
      background-color: #e0e0e0;
      border: 1px solid #ccc;
      text-align: center;
      line-height: 30px;
      cursor: pointer;
      border-radius: 4px;
    }
    .seat.selected {
      background-color: #28a745; /* Green color for selected seats */
      color: white;
    }
    .center-row {
      display: flex;
      justify-content: center; /* Center the seats horizontally */
      flex-wrap: wrap; /* Allow seats to wrap if necessary */
    }

    .legend-item {
      display: flex;
      align-items: center;
      margin-right: 20px; /* Space between legend items */
    }
    .legend-item .seat {
      width: 20px;
      height: 20px;
      background-color: #e0e0e0; /* Default color for seats */
      border: 1px solid #ccc;
      margin-right: 5px; /* Space between seat and label */
    }
    .legend-item .seat.available {
      background-color: #e0e0e0; /* Color for available seats */
    }
    .legend-item .seat.selected {
      background-color: #28a745; /* Color for selected seats */
    }
    .legend-item .seat.sold {
      background-color: #dc3545; /* Color for sold seats */
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

  <!-- Sticky Upper Part -->
  <div class="container mt-4">
  <div class="upper-part">
    <div class="row ml-2 mt-2">
      <div class="col-8">
        <h4><%=movie.getTitle() %></h4>
      </div>
      <div class="col-4 text-right">
        <a href="bookingSummary.jsp"><button class="btn">Book Now</button></a>
      </div>
    </div>
    <div class="row ml-2">
      <div class="col mt-2">
        <p class="small-text"><%=theater.getTheaterName() %>: <%=theater.getAddress() %> | Today, <%=date %>, <%=timming %></p>
      </div>
    </div>
  </div>
  </div>

<div class="container mt-4">
<% 
    // Retrieve the list of seat layouts from the request attribute
    List<seats_layout> listOfSeatLayout = (List<seats_layout>) request.getAttribute("listOfSeatLayout");
    
    // Iterate over each seat layout
    for (seats_layout seatLayout : listOfSeatLayout) {
%>
    <div class="row">
        <h6>Rs. <%= seatLayout.getPrice() %> <%= seatLayout.getCategoryName() %></h6>
    </div>
    <hr>
    <% 
        // Iterate over the rows in the current seat layout
        for (Long i = 1L; i <= seatLayout.getRow_count(); i++) {
            String str = seatLayout.getCategoryName().substring(0, 1); // Get the first letter of the category name
            String str1 = str + i; // Create the row prefix, e.g., 'P1', 'E1', etc.
    %>
    <div class="row center-row">
        <div class="mr-4"><%= str1 %></div>
        <% 
            // Iterate over the columns in the current row and display seats in one row
            for (Long j = 1L; j <= seatLayout.getColumn_count(); j++) {
        %>
        <div class="seat d-inline-block"><%= j %></div>
        <% 
            } // End of columns loop
        %>
    </div>
    <% 
        } // End of rows loop
    } // End of seat layouts loop
%>
</div>
  
  <div class="row">
    <h6>Rs 230 Royal Gold</h6>
  </div>
  <hr>
  <div class="row center-row">
    <div class="mr-4">B</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
  </div>
  <div class="row center-row">
    <div class="mr-4">C</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
  </div>
  <div class="row center-row">
    <div class="mr-4">D</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
  </div>
  <div class="row center-row">
    <div class="mr-4">E</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
  </div>
  <div class="row center-row">
    <div class="mr-4">F</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
  </div>

  <div class="row center-row mt-4">
    <div class="mr-4">G</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>

  </div>

  <div class="row center-row">
    <div class="mr-4">H</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>

  </div>
  <div class="row center-row">
    <div class="mr-4">I</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>

  </div>
  <div class="row center-row">
    <div class="mr-4">J</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>

  </div>
  <div class="row center-row">
    <div class="mr-4">K</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>
  </div>

  <div class="row">
    <h6>Rs 200 Royal Silver</h6>
  </div>
  <hr>

  <div class="row center-row">
    <div class="mr-4">L</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>
  </div>
  <div class="row center-row">
    <div class="mr-4">M</div>
    <div class="seat">1</div>
    <div class="seat">2</div>
    <div class="seat">3</div>
    <div class="seat">4</div>
    <div class="seat">5</div>
    <div class="seat">6</div>
    <div class="seat">7</div>
    <div class="seat">8</div>
    <div class="seat">9</div>
    <div class="seat">10</div>
    <div class="seat">11</div>
    <div class="seat">12</div>
    <div class="seat">13</div>
    <div class="seat">14</div>
    <div class="seat">15</div>
  </div>

  <div class="row mt-4">
    <div class="col text-center">
      All eyes this way! Please!
    </div>
  </div>

 
  <div class="row">
    <div class="legend-item">
      <div class="seat available"></div> Available
    </div>
    <div class="legend-item">
      <div class="seat selected"></div> Selected
    </div>
    <div class="legend-item">
      <div class="seat sold"></div> Sold
    </div>
  </div>

</div>

<script>
  document.querySelectorAll('.seat').forEach(seat => {
    seat.addEventListener('click', function() {
      this.classList.toggle('selected');
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
  </body>
</html>