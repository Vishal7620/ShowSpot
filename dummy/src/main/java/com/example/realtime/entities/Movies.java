package com.example.realtime.entities;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
public class Movies {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private String genre;
	private Date releaseDate;
	private String location;
	private String language;
	private long duration;
	private String posterName;
	private String about;
	public Movies() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Movies(Long id, String title, String genre, Date releaseDate,String location,String language ,long duration,String posterName,String about) {
		super();
		this.id = id;
		this.title = title;
		this.genre = genre;
		this.releaseDate = releaseDate;
		this.location=location;
		this.language=language;
		this.duration=duration;
		this.posterName=posterName;
		this.about=about;
	}
	public long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	
	public String getLoaction() {
		return location;
	}
	public void setLoaction(String loaction) {
		this.location = loaction;
	}
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	
	
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
		this.duration = duration;
	}
	
	public String getPosterName()
	{
		return posterName;
	}
	
	public void setPosterName()
	{
		this.posterName=posterName;
	}
	
	
	
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	@Override
	public String toString() {
		return "Movies [id=" + id + ", title=" + title + ", genre=" + genre + ", releaseDate=" + releaseDate
				+ ", location=" + location + ", language=" + language + ", duration=" + duration + ", posterName="
				+ posterName + "]";
	}
	

	
	
}
