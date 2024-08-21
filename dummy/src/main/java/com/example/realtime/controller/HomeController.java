package com.example.realtime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.realtime.entities.Movies;
import com.example.realtime.entities.Shows;
import com.example.realtime.services.MoviesService;
import com.example.realtime.services.ShowsServices;

@Controller
public class HomeController {

	@Autowired
	private MoviesService moviesService;
	
	@Autowired
	private ShowsServices showsServices;
	
	@RequestMapping("/views/home")
	public ModelAndView home(Model model)
	{
		List<Movies>movies=moviesService.getAllMovies();
		List<Shows>shows=showsServices.getfindAllShows();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("movies",movies);
		modelAndView.addObject("shows",shows);
		modelAndView.setViewName("home");
		return modelAndView;
	}
	
//	
	@RequestMapping("/views/dummy")
	public ModelAndView home1(Model model)
	{
		List<Movies>movies=moviesService.getAllMovies();
		List<Shows>shows=showsServices.getfindAllShows();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("movies",movies);
		modelAndView.addObject("shows",shows);
		modelAndView.setViewName("dummy");
		return modelAndView;
	}

}
