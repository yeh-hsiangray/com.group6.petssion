package com.group6.petssion.friendlyEnvProfile.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.group6.petssion.bean.FriendlyEnv;

public class FriendlyEnvValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return FriendlyEnv.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("Validation is being executed");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "", "姓名欄位不正確");
		ValidationUtils.rejectIfEmpty(errors, "telephone", "", "電話欄位不正確");
		ValidationUtils.rejectIfEmpty(errors, "address", "", "地址欄位不正確");

		FriendlyEnv friendlyEnv = (FriendlyEnv) target;

		System.out.println(
				"value of the city===>" + friendlyEnv.getCity() + "---instance" + friendlyEnv.getCity().getClass());
		System.out.println("value of checkbox==> " + friendlyEnv.getAnimalTypes());
		System.out.println("value of radioBtn===> " + friendlyEnv.getEnvTypes());
		
		if (friendlyEnv.getCity().equals("-1")) {
			errors.rejectValue("city", "", "必須選擇城市");
		}
		
		if(friendlyEnv.getAnimalTypes()==null) {
			errors.rejectValue("animalTypes", "", "必須選擇寵物類型");
		}
		
		if(friendlyEnv.getEnvTypes()==null) {
			errors.rejectValue("envTypes", "", "必須選擇寵物環境類型");
		}
	

		if (friendlyEnv.getName() != null && friendlyEnv.getName().length() < 2
				|| friendlyEnv.getName().length() > 30) {
			errors.rejectValue("name", "", "姓名欄位需2個字元以上，30字元以下");
		}

	}

}
