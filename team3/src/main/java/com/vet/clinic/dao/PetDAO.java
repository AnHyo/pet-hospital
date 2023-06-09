package com.vet.clinic.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.vet.clinic.dto.PetDTO;


@Repository
@Mapper
public interface PetDAO {
	
	List<PetDTO> petInfo(PetDTO petDTO);

	List<PetDTO> petVaccine(PetDTO petDTO);

	List<PetDTO> petChart(PetDTO petDTO);

	List<PetDTO> petMedicalData(PetDTO petDTO);

	


}
