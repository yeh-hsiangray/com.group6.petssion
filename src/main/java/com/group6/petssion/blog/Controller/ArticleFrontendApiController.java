package com.group6.petssion.blog.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Service.ArticleFrontendService;

@RestController
@RequestMapping(value = "/frontend/blog/api")
public class ArticleFrontendApiController {

	@Autowired
	private ArticleFrontendService service;
	
	// 文章首頁
	// URL EXAMPLE:/frontend/blog/api/latestArticle?page=1&size=5
	@GetMapping("/latestArticle")
	public Page<Article> getArticleIndex(@RequestParam Integer page,@RequestParam Integer size) {		
		return service.getArticlePageRepository(page-1, size);
	}
	@GetMapping("/hotArticle")
	public Page<Article> getArticleForHit(@RequestParam Integer page,@RequestParam Integer size) {		
		return service.getArticleHitRepository(page-1, size);
	}
	// 文章首頁
	// URL EXAMPLE:/frontend/blog/api/searchArticle?page=1&size=5&search=保護&type=title
	@GetMapping("/searchArticle")
	public Page<Article> getArticleForSearch(@RequestParam Integer page,@RequestParam Integer size,
			@RequestParam String search,@RequestParam String type) {		
		return service.getArticlesForSearch(page-1, size,search,type);
	}

	// URL EXAMPLE:/frontend/blog/api/tagArticle?page=1&size=5&tag=廠務當加
	@GetMapping("/tagArticle")
	public Page<Article> getArticleForTag(@RequestParam Integer page,@RequestParam Integer size,@RequestParam String tag) {		
		return service.getArticlesForTag(page-1, size,tag);
	}
}