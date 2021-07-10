 package com.group6.petssion.blog.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Service.ArticleFrontendService;

@Controller
@RequestMapping(value = "/frontend/blog")
public class ArticleFrontendController {

	@Autowired
	private ArticleFrontendService service;

	// -----------------------------------READ------------------------------------
	// 搜尋顯示頁面
	// URL EXAMPLE:/blog/list/search?search={searchStr}&type={searchType}
	@RequestMapping(value = "/list/search", method = { RequestMethod.GET })
	public String getArticlesForSearch(Model model, @RequestParam(value = "search") String search,
			@RequestParam(value = "type") String type) {
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		getRightSideData(model);
	//	model.addAttribute("article", service.getArticlesForSearch(search, type));
		return "/frontend/blog/searchList";
	}

	// 文章首頁
	// URL EXAMPLE:/blog/index
	@RequestMapping(value = "/index", method = { RequestMethod.GET })
	public String getArticleIndex(Model model) {
		//model.addAttribute("indexArticles", service.getArticlePageRepository(0, 100).toList());
		getRightSideData(model);
		return "/frontend/blog/column";
	}

	//單獨顯示頁面
	//URL EXAMPLE:/blog/article/{id}
	@RequestMapping(value = "/article/{id}", method = { RequestMethod.GET })
	public String getArticleById(Model model, @PathVariable int id) {
		Article article= service.getArticleById(id);
		if(article.getHitCount()==null) {
			article.setHitCount(1);
		}else {
			article.setHitCount(article.getHitCount()+1);
		}
		service.UpdateArticles(article);
		model.addAttribute("singleArticle", article);
		getRightSideData(model);
		return "/frontend/blog/articles";	
	}
	
	// 點擊TAG之後的顯示頁面
	// URL EXAMPLE/blog/list/tag?=寵物美容
	@RequestMapping(value = "/list/tag", method = { RequestMethod.GET })
	public String getArticlesForTag(Model model, @RequestParam String tag) {
		model.addAttribute("tag", tag);
	//	model.addAttribute("tagList", service.getArticlesForTag(tag));
		getRightSideData(model);
		return "/frontend/blog/tags";
	}

	//sidebar controller
	private void getRightSideData(Model model) {
		model.addAttribute("tagGroup", service.getArticleGroupTags());
		model.addAttribute("latestArticles", service.getArticlePageRepository(0, 5).toList());
		model.addAttribute("hotArticle", service.getArticleHitRepository(0, 5).toList());
	}
	

	// 搜尋顯示頁面
	// URL EXAMPLE:/blog/list/search/寵物
	// @RequestMapping(value = "/listAll", method = { RequestMethod.GET })
	// public String getAllArticles(Model model, @PathVariable String AllArticle) {

	// model.addAttribute("products", service.getAllArticleRepository(1, 100));
	// System.out.println("Returning rpod ucts:");
	// return "/frontend/blog/listAll";
	// }

//	// group顯示頁面
//	// URL EXAMPLE:/blog/list/group
//	@RequestMapping(value = "/list/tag/group", method = { RequestMethod.GET })
//	public String getViewForTag(Model model) {
//		model.addAttribute("article", service.getArticleGroupTags());
//		return "/frontend/blog/list/tag/group";
//	}
//
//	// 最新文章顯示頁面
//	@RequestMapping(value = "/list/latest", method = { RequestMethod.GET })
//	public String getLastestArticles(Model model, @PathVariable String LastestArticle) {
//		model.addAttribute("article", service.getAllArticleRepository(1,5));
//			return "blog/list/latest";
//		}
	
	
}