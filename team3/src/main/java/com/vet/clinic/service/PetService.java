package com.vet.clinic.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vet.clinic.dao.PetDAO;
import com.vet.clinic.dto.PetDTO;


@Service
public class PetService {
	
	@Resource(name = "petDAO")
	private PetDAO petDAO;

	public List<PetDTO> petInfo(PetDTO petDTO) {
		return petDAO.petInfo(petDTO);
	}

	public List<PetDTO> petVaccine(PetDTO petDTO) {
		return petDAO.petVaccine(petDTO);
	}


	public List<PetDTO> petChart(PetDTO petDTO) {
		return petDAO.petChart(petDTO);
	}

	public List<PetDTO> petMedicalData(PetDTO petDTO) {
		return petDAO.petMedicalData(petDTO);
	}



	
	

}
