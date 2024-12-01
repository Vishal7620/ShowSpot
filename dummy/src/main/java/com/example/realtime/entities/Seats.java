package com.example.realtime.entities;

import java.time.LocalDateTime;

import org.antlr.v4.runtime.misc.NotNull;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Seats {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long seatId;
	
	private int seatRow;
	private int columnNumber;
	private String seatNumber;
	private boolean available;
	private boolean isGap;
	private boolean sold;
	private  boolean held;
    private LocalDateTime holdExpirationTime;
	private String Layout_type;
	private int price;
	
	 @ManyToOne
	    @JoinColumn(name = "booking_id") // This will create the foreign key in Seats table
	    private Bookings booking;
	
	public Seats() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Seats(Long seatId, int seatRow, int columnNumber, String seatNumber, boolean available, boolean isGap,
			String Layout_type, boolean sold,boolean held,
			LocalDateTime holdExpirationTime,int price) {
		super();
		this.seatId = seatId;
		this.seatRow = seatRow;
		this.columnNumber = columnNumber;
		this.seatNumber = seatNumber;
		this.available = available;
		this.isGap = isGap;
		this.sold=sold;
		this.Layout_type=Layout_type;
		this.held=held;
		this.holdExpirationTime=holdExpirationTime;
		this.price=price;
	}
	public Long getSeatId() {
		return seatId;
	}
	public void setSeatId(Long seatId) {
		this.seatId = seatId;
	}
	public int getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}
	public int getColumnNumber() {
		return columnNumber;
	}
	public void setColumnNumber(int columnNumber) {
		this.columnNumber = columnNumber;
	}
	public String getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public boolean isGap() {
		return isGap;
	}
	public void setGap(boolean isGap) {
		this.isGap = isGap;
	}
	
	public boolean isSold()
	{
		return sold;
	}
	
	public void setSold(boolean sold)
	{
		this.sold=sold;
	}
	
	
	
	public boolean isHeld() {
		return held;
	}
	public void setHeld(boolean held) {
		this.held = held;
	}
	
	
	public LocalDateTime getHoldExpirationTime() {
		return holdExpirationTime;
	}
	public void setHoldExpirationTime(LocalDateTime holdExpirationTime) {
		this.holdExpirationTime = holdExpirationTime;
	}
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Seats [seatId=" + seatId + ", seatRow=" + seatRow + ", columnNumber=" + columnNumber + ", seatNumber="
				+ seatNumber + ", available=" + available + ", isGap=" + isGap +  "]";
	}
	
	
	
}
