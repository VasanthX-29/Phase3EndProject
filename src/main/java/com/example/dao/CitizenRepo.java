package com.example.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.entity.Citizen;
import com.example.entity.VaccineCenter;


@Repository
public interface CitizenRepo extends JpaRepository<Citizen,Integer> {
	
	@Query("select c from Citizen c where c.vc=?1")
	public List<Citizen> getCitizensofACenter(VaccineCenter vaccinecenter);
	
	@Modifying
	@Query("delete from Citizen c where c.vc=?1")
	public void deleteAllCitizensofAnCenter(VaccineCenter vaccinecenter);

}
