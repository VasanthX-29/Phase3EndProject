package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CenterRepo;
import com.example.entity.VaccineCenter;

@Service
public class CenterService {
	
	@Autowired
	CenterRepo repo;
	
	public VaccineCenter saveCenter(VaccineCenter vc)
	{
		return repo.save(vc);
	}
	
	public List<VaccineCenter> getall(){
		return repo.findAll();
	}
	
	public Optional<VaccineCenter> getbyid(int id)
	{
		return repo.findById(id);
	}
	
	public String deleteCenterById(int id)
	{
		repo.deleteById(id);
		return "success";
	}
	
	public VaccineCenter getbyName(String name)
	{
		return repo.findbyName(name);
	}

}
