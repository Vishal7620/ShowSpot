package com.example.realtime.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Shows {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long showId;
	private String name;
	private String Location;
	private LocalDateTime time;
	public Shows() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Shows(Long showId, String name, String location, LocalDateTime time) {
		super();
		this.showId = showId;
		this.name = name;
		Location = location;
		this.time = time;
	}
	public Long getShowId() {
		return showId;
	}
	public void setShowId(Long showId) {
		this.showId = showId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Shows [showId=" + showId + ", name=" + name + ", Location=" + Location + ", time=" + time + "]";
	}
	
	
}
