package com.example.realtime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.realtime.entities.Theaters;
import com.example.realtime.services.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private TheaterService theaterService;
//	
//	@GetMapping("/views/selectTheater")
//	public ModelAndView getTheatersByCity(@RequestParam("movieId")long movieId,@RequestParam("city")String city)
//	{
//		ModelAndView modelAndView=new ModelAndView();
//		
//		try {
//			
//			List<Theaters> theaters=theaterService.findTheatersByCity(city);
//			
//			modelAndView.addObject("theaters",theaters);
//			modelAndView.setViewName("selectTheater");
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			
//			modelAndView.setViewName("error");
//			e.printStackTrace();
//		}
//		return modelAndView;
//	}
}
