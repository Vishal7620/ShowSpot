<%@page import="com.example.realtime.entities.Seats"%>
<%@page import="com.example.realtime.entities.seats_layout"%>
<%@page import="java.util.List"%>
<%@page import="com.example.realtime.entities.Theaters"%>
<%@page import="com.example.realtime.entities.Movies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    int s_index=0;
    
    Movies movie=(Movies)request.getAttribute("movie");
    Theaters theater=(Theaters)request.getAttribute("theater");
    String date=(String)request.getAttribute("date");
    String timming=(String)request.getAttribute("timming");
    List<Seats>seats=(List<Seats>)request.getAttribute("seatList");
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
    .seat.available
    {
    background-color: white ;/* Color for sold seats */
      border:1px solid green;
    }
    .seat.sold
    {
     background-color: #e0e0e0;
    }
    .seat.selected {
      background-color: #28a745; /* Green color for selected seats */
      color: white;
    }
    .seat.held {
    background-color: orange; /* Held seats are orange */
    cursor: not-allowed;
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
    .legend-item .seat.sold {
      background-color: #e0e0e0; /* Color for available seats */
    }
    .legend-item .seat.selected {
      background-color: #28a745; /* Color for selected seats */
    }
    .legend-item .seat.available {
      background-color: white ;/* Color for sold seats */
      border:1px solid green;
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
    
     .gap {
    width: 30px;
    height: 30px;
    background-color: transparent; /* Or any color you want for the gap */
    margin: 5px;
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
    <form action="/bookingSummary?movieId=<%=movie.getId()%>&theaterId=<%=theater.getTheaterId()%>" method="POST">
        <input type="hidden" id="selectedSeats" name="selectedSeats" value="">
        <button type="submit" class="btn">Book Now</button>
    </form>
     </div>
      
      
     <!--  <div class="col-4 text-right">
        <a href="bookingSummary.jsp"><button class="btn">Book Now</button></a>
      </div> -->
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
    Long s=0L;

        // Iterate over the rows in the current seat layout
        for (Long i = 1L; i <= seatLayout.getRow_count(); i++) {
            String str = seatLayout.getCategoryName().substring(0, 1); // Get the first letter of the category name
            String str1 = str + i; // Create the row prefix, e.g., 'P1', 'E1', etc.
           
    %>
    <div class="row center-row">
        <div class="mr-4"><%= str1 %></div>
        <% 
          Long index=1L;
            // Iterate over the columns in the current row and display seats in one row
            for (Long j = 1L; j <= seatLayout.getColumn_count(); j++) {
            	Seats temp=seats.get(s_index);
             	if(temp.isGap()==false){
        %>
        <div class="seat d-inline-block 
        <%
        if(temp.isAvailable()==true)
        {
        	out.print("available");
        }
        else
        {
        	out.print("sold");
        }
        %>"
        data-seat-id="<%=temp.getSeatId()%>">
        <%= index%>
        </div>
        <% 
        ++index;
            	}
            	else
            	{
            		%>
            		 <!-- Display a gap placeholder -->
                    <div class="gap d-inline-block"></div>
            		<%
            	}
            	s_index++;
            	
            } // End of columns loop
        %>
    </div>
    <% 
        } // End of rows loop
    } // End of seat layouts loop
%>
</div>
  
  
  <div class="row mt-4">
    <div class="col text-center">
      All eyes this way! Please!
    </div>
  </div>


  
  <div class="row justify-content-center">
  <div class="legend-item">
    <div class="seat sold"></div> Sold
  </div>
  <div class="legend-item">
    <div class="seat selected"></div> Selected
  </div>
  <div class="legend-item">
    <div class="seat available"></div> Available
  </div>
</div>

</div>

<script>

let selectedSeats=[];

document.querySelectorAll('.seat.available').forEach(seat=>{
	seat.addEventListener('click',function(){
		
		const seatId=this.getAttribute('data-seat-id');
		
		if(this.classList.contains('selected')){
			this.classList.remove('selected');
			selectedSeats = selectedSeats.filter(id => id !== seatId);
		}else{
			this.classList.add('selected');
			selectedSeats.push(seatId);
			holdSeat(seatId,this);
		}
	});
});


document.querySelector('form').addEventListener('submit', function(event) {
    // Convert the selectedSeats array to a string and store it in a hidden input
    document.getElementById('selectedSeats').value = selectedSeats.join(',');
});

/* document.querySelectorAll('.seat.available').forEach(seat => {
    seat.addEventListener('click', function() {
        this.classList.add('selected');
        
        const seatId = this.getAttribute('data-seat-id');
        console.log(seatId);
        holdSeat(seatId, this);
    });
}); */

function holdSeat(seatId, seatElement) {
    fetch(`/hold-seat`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ seatId: seatId }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Seat ${seatId} is held for 3 minutes.`);
            
            // Automatically release the seat after 3 minutes if not booked
            setTimeout(() => {
                releaseSeat(seatId, seatElement);
            }, 3 * 60 * 1000); // 3 minutes in milliseconds
        } else {
            seatElement.classList.remove('selected'); // unmark seat if holding fails
            alert('Seat is no longer available.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function releaseSeat(seatId, seatElement) {
    fetch(`/release-seat`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ seatId: seatId }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Seat ${seatId} released.`);
            seatElement.classList.remove('selected');
            seatElement.classList.add('available'); // Mark seat as available again
        } else {
            console.error(`Failed to release seat ${seatId}.`);
        }
    })
    .catch(error => {
        console.error('Error releasing the seat:', error);
    });
}



  
  


 </script>

  </body>
</html>