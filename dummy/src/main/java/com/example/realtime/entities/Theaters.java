package com.example.realtime.entities;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Theaters {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long theaterId;
	private String theaterName;
	private String address;
	private String detailedAdd;
    private Date movieTimings;
    private String soundtype;
    private String layout_type;
    @ManyToOne
    @JoinColumn(name="movie_id")
    private Movies movie;
	public Theaters() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Theaters(Long theaterId, String theaterName, String address, String detailedAdd, Date movieTimings,
			String soundtype, Movies movie,String layout_type) {
		super();
		this.theaterId = theaterId;
		this.theaterName = theaterName;
		this.address = address;
		this.detailedAdd = detailedAdd;
		this.movieTimings = movieTimings;
		this.soundtype = soundtype;
		this.movie = movie;
		this.layout_type=layout_type;
	}
	public long getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(Long theaterId) {
		this.theaterId = theaterId;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailedAdd() {
		return detailedAdd;
	}
	public void setDetailedAdd(String detailedAdd) {
		this.detailedAdd = detailedAdd;
	}
	public Date getMovieTimings() {
		return movieTimings;
	}
	public void setMovieTimings(Date movieTimings) {
		this.movieTimings = movieTimings;
	}
	public String getSoundtype() {
		return soundtype;
	}
	public void setSoundtype(String soundtype) {
		this.soundtype = soundtype;
	}
	public Movies getMovie() {
		return movie;
	}
	public void setMovie(Movies movie) {
		this.movie = movie;
	}
	
	public String getLayout()
	{
		return layout_type;
	}
	public void setLayout(String layout_type)
	{
		this.layout_type=layout_type;
	}
	@Override
	public String toString() {
		return "Theaters [theaterId=" + theaterId + ", theaterName=" + theaterName + ", address=" + address
				+ ", detailedAdd=" + detailedAdd + ", movieTimings=" + movieTimings + ", soundtype=" + soundtype
				+ ", movie=" + movie + "]";
	}
        
}
