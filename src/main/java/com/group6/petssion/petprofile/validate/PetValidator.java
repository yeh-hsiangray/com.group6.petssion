package com.group6.petssion.petprofile.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.group6.petssion.bean.Pet;

public class PetValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = Pet.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Pet pet = (Pet) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "pet.name.not.empty", "姓名欄不能空白");

		String age = String.valueOf(pet.getAge());
		if (age.matches("^\\+?[1-9][0-9]*$")) {
			errors.rejectValue("age", "", "必須為整數");
		} else if (pet.getAge() > 0 && pet.getAge() < 25) {
			errors.rejectValue("age", "", "年齡異常");
		}
		
		if(pet.getType().getId()==-1) {
			errors.rejectValue("type","", "必須挑選種類欄的選項");
		}
		if(pet.getKind().getId()==-1) {
			errors.rejectValue("kind","", "必須挑選種類欄的選項");
		}
		
		if(pet.getType().getId()==1) {
			for(int i=1;pet.getKind().getId()<6;i++) {
				if(!(pet.getKind().getId()==i)) {
					errors.rejectValue("kind","", "必須挑選貓的種類");
				}
			}
		}
		
		if(pet.getType().getId()==2) {
			for(int i=6;pet.getKind().getId()<9;i++) {
				if(!(pet.getKind().getId()==i)) {
					errors.rejectValue("kind","", "必須挑選狗的種類");
				}
			}
		}
	}
}
