<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            width: 100px;
            height: 100px;
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
                    <!-- Card 1 -->
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="food1.jpg" class="card-img" alt="Food 1">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">Food Name 1</h5>
                                        <p class="card-text">$10.00</p>
                                        <button class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="food2.jpg" class="card-img" alt="Food 2">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">Food Name 2</h5>
                                        <p class="card-text">$12.00</p>
                                        <button class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="food3.jpg" class="card-img" alt="Food 3">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">Food Name 3</h5>
                                        <p class="card-text">$15.00</p>
                                        <button class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card 4 -->
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="food4.jpg" class="card-img" alt="Food 4">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">Food Name 4</h5>
                                        <p class="card-text">$8.00</p>
                                        <button class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   <!-- Card 5 -->
                   <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="food4.jpg" class="card-img" alt="Food 4">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Food Name 4</h5>
                                    <p class="card-text">$8.00</p>
                                    <button class="btn btn-primary">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Card 6 -->
                <div class="col-md-6 mb-4">
                  <div class="card">
                      <div class="row no-gutters">
                          <div class="col-md-4">
                              <img src="food4.jpg" class="card-img" alt="Food 4">
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title">Food Name 4</h5>
                                  <p class="card-text">$8.00</p>
                                  <button class="btn btn-primary">Add</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- Card 7 -->
              <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="food4.jpg" class="card-img" alt="Food 4">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Food Name 4</h5>
                                <p class="card-text">$8.00</p>
                                <button class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Card 8 -->
            <div class="col-md-6 mb-4">
              <div class="card">
                  <div class="row no-gutters">
                      <div class="col-md-4">
                          <img src="food4.jpg" class="card-img" alt="Food 4">
                      </div>
                      <div class="col-md-8">
                          <div class="card-body">
                              <h5 class="card-title">Food Name 4</h5>
                              <p class="card-text">$8.00</p>
                              <button class="btn btn-primary">Add</button>
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
                <p>Seat Information: 12A, 12B</p>
                <p>Seat Price: $10.00</p>
                <div class="gray-line"></div>
                <div class="amount-payable">
                    <h5>Subtotal Amount Payable</h5>
                    <p>$40.00</p>
                </div>
                <button class="btn booking-summary-button">
                  <span>Total Rs 40.00</span>
                  <span class="proceed-text">Proceed</span>
              </button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
