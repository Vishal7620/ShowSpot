package com.example.realtime.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class seats_layout {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long LayoutId ;
    private String categoryName;
    private int price;
	private Long row_count;
	private Long column_count;
	
	@ManyToOne
	@JoinColumn(name="theater_id")
	private Theaters theater;
	
	@OneToMany(mappedBy="seatLayout",cascade=CascadeType.ALL)
	private List<Seats> seats=new ArrayList<>();

	public seats_layout() {
		super();
		// TODO Auto-generated constructor stub
	}

	public seats_layout(Long layoutId, String categoryName, int price, Long row_count, Long column_count,
			Theaters theater, List<Seats> seats) {
		super();
		LayoutId = layoutId;
		this.categoryName = categoryName;
		this.price = price;
		this.row_count = row_count;
		this.column_count = column_count;
		this.theater = theater;
		this.seats = seats;
	}

	public Long getLayoutId() {
		return LayoutId;
	}

	public void setLayoutId(Long layoutId) {
		LayoutId = layoutId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Long getRow_count() {
		return row_count;
	}

	public void setRow_count(Long row_count) {
		this.row_count = row_count;
	}

	public Long getColumn_count() {
		return column_count;
	}

	public void setColumn_count(Long column_count) {
		this.column_count = column_count;
	}

	public Theaters getTheater() {
		return theater;
	}

	public void setTheater(Theaters theater) {
		this.theater = theater;
	}

	public List<Seats> getSeats() {
		return seats;
	}

	public void setSeats(List<Seats> seats) {
		this.seats = seats;
	}

	@Override
	public String toString() {
		return "seats_layout [LayoutId=" + LayoutId + ", categoryName=" + categoryName + ", price=" + price
				+ ", row_count=" + row_count + ", column_count=" + column_count + ", theater=" + theater + ", seats="
				+ seats + "]";
	}
	
	
}
