package com.example.realtime.entities;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Bookings {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long booking_id;
	
	private String fullName;
	private Long amount;
	private String email;
	private Long movieId;
	private Long theaterId;
	private Long phone;
	private Date booking_date;
	
	@OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    private List<Seats> bookedSeats;
	public Bookings() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bookings(Long booking_id, String fullName, Long amount, String email, Long movieId, Long theaterId,Long phone,
			
			List<Seats>bookedSeats,Date booking_date) {
		super();
		this.booking_id = booking_id;
		this.fullName = fullName;
		this.amount = amount;
		this.email = email;
		this.movieId = movieId;
		this.theaterId = theaterId;
		this.phone=phone;
		this.bookedSeats=bookedSeats;
		this.booking_date=booking_date;
	}
	public Long getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(Long booking_id) {
		this.booking_id = booking_id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getMovieId() {
		return movieId;
	}
	public void setMovieId(Long movieId) {
		this.movieId = movieId;
	}
	public Long getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(Long theaterId) {
		this.theaterId = theaterId;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public List<Seats> getBookedSeats() {
		return bookedSeats;
	}
	public void setBookedSeats(List<Seats> bookedSeats) {
		this.bookedSeats = bookedSeats;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	
	
}
