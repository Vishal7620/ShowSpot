package com.example.realtime.entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "theaterTimmings")
public class TheaterTimmings {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long theaterTimmingsId;

	
	    @ManyToOne
	    @JoinColumn(name="movie_id", insertable=false, updatable=false)
	    private Movies movie;
	    
	    @ManyToOne
	    @JoinColumn(name="theater_id", insertable=false, updatable=false)
	    private Theaters theater;
        
	    private Date theaterTimmings;

		public TheaterTimmings() {
			super();
			// TODO Auto-generated constructor stub
		}

		public TheaterTimmings(Long theaterTimmingsId, Movies movie, Theaters theater, Date theaterTimmings) {
			super();
			this.theaterTimmingsId = theaterTimmingsId;
			this.movie = movie;
			this.theater = theater;
			this.theaterTimmings = theaterTimmings;
		}

		public Long getTheaterTimmingsId() {
			return theaterTimmingsId;
		}

		public void setTheaterTimmingsId(Long theaterTimmingsId) {
			this.theaterTimmingsId = theaterTimmingsId;
		}

		public Movies getMovie() {
			return movie;
		}

		public void setMovie(Movies movie) {
			this.movie = movie;
		}

		public Theaters getTheater() {
			return theater;
		}

		public void setTheater(Theaters theater) {
			this.theater = theater;
		}

		public Date getTheaterTimmings() {
			return theaterTimmings;
		}

		public void setTheaterTimmings(Date theaterTimmings) {
			this.theaterTimmings = theaterTimmings;
		}

		@Override
		public String toString() {
			return "TheaterTimmings [theaterTimmingsId=" + theaterTimmingsId + ", movie=" + movie + ", theater="
					+ theater + ", theaterTimmings=" + theaterTimmings + "]";
		}
		
	    
	   
		
    
}
