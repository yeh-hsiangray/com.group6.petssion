package com.group6.petssion.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.group6.petssion.blog.Service.ArticleFrontendService;

@Controller
@RequestMapping(value = "/frontend/main")
public class MainFrontendController {

	@Autowired
	private ArticleFrontendService service;
		// -----------------------------------Direct------------------------------------
	@RequestMapping(value = "/aboutUs", method = { RequestMethod.GET })
	public String directPage1() {
		return "/frontend/main/aboutUs";
	}

	@RequestMapping(value = "/contact", method = { RequestMethod.GET })
	public String directPage2() {
		return "/frontend/main/contact";
	}
	
	@RequestMapping(value = "/cookie", method = { RequestMethod.GET })
	public String directPage3() {
		return "/frontend/main/cookie";
	}	
	
	@RequestMapping(value = "/customerservice", method = { RequestMethod.GET })
	public String directPage4() {
		return "/frontend/main/customerservice";
	}
	
	//sidebar controller
	private void getRightSideData(Model model) {
		model.addAttribute("tagGroup", service.getArticleGroupTags());
		model.addAttribute("latestArticles", service.getArticlePageRepository(0, 5).toList());
		model.addAttribute("hotArticle", service.getArticleHitRepository(0, 5).toList());
	}
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET })
	public String directPage5(Model model) {
		//這裡都沒塞東西你是想要取什麼
		getRightSideData(model);
		return "/frontend/main/index";
	}
	
	@RequestMapping(value = "/legal", method = { RequestMethod.GET })
	public String directPage6() {
		return "/frontend/main/legal";
	}
	
	@RequestMapping(value = "/privacyPolicies")
	public String directPage7() {
		return "/frontend/main/privacyPolicies";
	}
	
	@RequestMapping(value = "/support")
	public String directPage8() {
		return "/frontend/main/support";
	}
	@RequestMapping(value = "/vipMember")
	public String directPage9() {
		return "/frontend/main/vipMember";
	}
	@RequestMapping(value = "/test")
	public String directPage10() {
		return "/frontend/main/test";
	}
}