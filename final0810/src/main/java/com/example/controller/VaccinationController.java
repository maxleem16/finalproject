package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.VaccinationMapper;

@Controller
public class VaccinationController {
	@Autowired
	VaccinationMapper mapper;

	@RequestMapping("/vaccination/list2")
	public void list2(Model model) {
		model.addAttribute("list", mapper.list());
	}

	@RequestMapping("/vaccination/local")
	public void local() {
	}

	@RequestMapping("/vaccination/animal")
	public void animal() {
	}

	@RequestMapping("/vaccination/list")
	public void list(Model model) {
		model.addAttribute("list", mapper.list());
	}

	@RequestMapping("/vaccination/API")
	public void list() {
	}
}
