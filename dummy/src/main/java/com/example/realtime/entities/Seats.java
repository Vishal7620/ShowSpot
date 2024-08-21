package com.example.realtime.entities;

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
	@ManyToOne
	@JoinColumn(name="layout_id")
	private seats_layout seatLayout;
	public Seats() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Seats(Long seatId, int seatRow, int columnNumber, String seatNumber, boolean available, boolean isGap,
			seats_layout seatLayout) {
		super();
		this.seatId = seatId;
		this.seatRow = seatRow;
		this.columnNumber = columnNumber;
		this.seatNumber = seatNumber;
		this.available = available;
		this.isGap = isGap;
		this.seatLayout = seatLayout;
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
	public seats_layout getSeatLayout() {
		return seatLayout;
	}
	public void setSeatLayout(seats_layout seatLayout) {
		this.seatLayout = seatLayout;
	}
	@Override
	public String toString() {
		return "Seats [seatId=" + seatId + ", seatRow=" + seatRow + ", columnNumber=" + columnNumber + ", seatNumber="
				+ seatNumber + ", available=" + available + ", isGap=" + isGap + ", seatLayout=" + seatLayout + "]";
	}
	
	
	
}
