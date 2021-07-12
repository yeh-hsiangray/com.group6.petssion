package com.group6.petssion.blog.Controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.group6.petssion.blog.Model.Article;
//import com.group6.petssion.blog.Model.EditorForm;
import com.group6.petssion.blog.Service.ArticleBackendService;

@Controller
@RequestMapping(value = "/backend/blog")
public class ArticleBackendController {

	@Autowired
	private ArticleBackendService service;
	
	  public void setArticleBackendService(ArticleBackendService articleService) {
	        this.service = articleService;
	    }

	// -----------------------------------READ------------------------------------
	// 搜尋顯示頁面
	// URL EXAMPLE:/blog/list/search?search={searchStr}&type={searchType}
	@RequestMapping(value = "/list/search", method = { RequestMethod.GET })
	public String getArticlesForSearch(Model model, @RequestParam(value="search") String search, @RequestParam(value="type") String type) {
		
		//model.addAttribute("article", service.getArticlesForSearch(search,type));
		return "/backend/blog/search_list";
	}

//	// 搜尋顯示頁面
//	// URL EXAMPLE:/blog/list/search/寵物
//	@RequestMapping(value = "/listAll", method = { RequestMethod.GET })
//	public String getAllArticles(Model model, @PathVariable String AllArticle) {
//		
//		model.addAttribute("products", service.getAllArticleRepository(1,100));
//		System.out.println("Returning rpod ucts:");
//		return "/backend/blog/listAll";
//	}

	// 文章首頁
	// URL EXAMPLE:/blog/index
	@RequestMapping(value = "/index", method = { RequestMethod.GET })
	public String getArticleIndex(Model model) {
		
		return "/backend/blog/main";
	}
	
	//單獨顯示頁面
	//URL EXAMPLE:/blog/article/{id}
	@RequestMapping(value = "/article/edit", method = { RequestMethod.GET })
	public String getArticleById(Model model, @RequestParam(required=false) Integer id) {
		if(id!=null) {
			model.addAttribute("singleArticle", service.getArticleById(id));
		}else {
			model.addAttribute("singleArticle", new Article());
		}
		return "/backend/blog/editor";	
	}

	// ------------------------------------DELETE------------------------------------
	// 刪除選取文章的ID
	@DeleteMapping(value = "/delete/{id}")
	public String deleteArticlesById(Model model, @PathVariable Integer id) {
		service.deleteArticlesById(id);
		return "/backend/blog/delete/{id}";
	}
	
	//刪除集合
	@DeleteMapping(value = "/delete/{list}")
	public ResponseEntity<?> deleteArticlesByIds(@PathVariable List<Integer> ids) {     
			service.deleteArticlesByIds(ids);
		    return ResponseEntity.noContent().build();
	}
	

	// ------------------------------------UPDATE------------------------------------
	@PutMapping(value = "/update") 
	public ResponseEntity<?> UpdateArticlesByIds(Model model,@RequestBody Article article) {
		  try {
			    article =service.UpdateArticles(article);
	            return new ResponseEntity<>(HttpStatus.OK);
	        } catch (NoSuchElementException e) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }

	}
	// ------------------------------------counts------------------------------------
	@RequestMapping(value = "/home", method = { RequestMethod.GET })
	public String directPage(Model model) {
		model.addAttribute("binCount", service.getArticlePageRepository(0,1,1).getTotalElements()); //垃圾桶數量
		model.addAttribute("articleCount", service.getArticlePageRepository(1,1,1).getTotalElements()); //文章數量
		model.addAttribute("totolHitCount",service.getTotalHitCount());
		return "/backend/blog/home";
	}
	// ------------------------------------view------------------------------------

	@RequestMapping(value = "/editor", method = { RequestMethod.GET })
	public String directPage2() {
		return "/backend/blog/editor";
	}
	@RequestMapping(value = "/recycleBin", method = { RequestMethod.GET })
	public String directPage3() {
		return "/backend/blog/recycleBin";
	}
}