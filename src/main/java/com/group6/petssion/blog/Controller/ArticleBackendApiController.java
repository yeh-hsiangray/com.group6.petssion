package com.group6.petssion.blog.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Model.DelForm;
import com.group6.petssion.blog.Model.EditorForm;
import com.group6.petssion.blog.Service.ArticleBackendService;

@RestController
@RequestMapping(value = "/backend/blog/api")
public class ArticleBackendApiController {

	@Autowired
	private ArticleBackendService service;
	// 文章首頁
		// URL EXAMPLE:/frontend/blog/api/latestArticle?page=1&size=5
		@GetMapping("/latestArticle")
		public Page<Article> getArticleIndex(@RequestParam Integer page,@RequestParam Integer size) {		
			return service.getArticlePageRepository(1,page-1, size);
		}
		@GetMapping("/trashArticle")
		public Page<Article> getArticleTrash(@RequestParam Integer page,@RequestParam Integer size) {		
			return service.getArticlePageRepository(0,page-1, size);
		}
		// 文章首頁
		// URL EXAMPLE:/frontend/blog/api/searchArticle?page=1&size=5&search=保護&type=title
		@GetMapping("/searchArticle")
		public Page<Article> getArticleForSearch(@RequestParam Integer page,@RequestParam Integer size,@RequestParam String search,@RequestParam String type,@RequestParam String sortOrder) {		
			return service.getArticlesForSearch(page-1, size,search,type,sortOrder.equals("ASC"));
		}
		// 文章首頁
		// URL EXAMPLE:/frontend/blog/api/searchArticle?page=1&size=5&search=保護&type=title
		@GetMapping("/searchArticleInBin")
		public Page<Article> getArticleForSearchInBin(@RequestParam Integer page,@RequestParam Integer size,@RequestParam String search,@RequestParam String type,@RequestParam String sortOrder) {		
			return service.getArticlesForSearchInBin(page-1, size,search,type,sortOrder.equals("ASC"));
		}

		// URL EXAMPLE:/frontend/blog/api/tagArticle?page=1&size=5&tag=廠務當加
		@GetMapping("/tagArticle")
		public Page<Article> getArticleForTag(@RequestParam Integer page,@RequestParam Integer size,@RequestParam String tag) {		
			return service.getArticlesForTag(page-1, size,tag);
		}
		//刪除到垃圾桶
		@PostMapping("/updateArticleStatus")
		public ResponseEntity<String>  deleteArticleForIds (@RequestBody DelForm data) {
			if(data.getS1()==0 && data.getS2()<0) {
				service.deleteArticlesByIds(data.getIds());
			}else {
				service.updateArticleStatusByIds(data.getIds(), data.getS1(), data.getS2());
			}

			return new ResponseEntity<>("{\"msg\":\"OK\"}", HttpStatus.OK);
		}
		// ------------------------------------CREATE------------------------------------
		//editForm ajax傳入的資料
		@PostMapping(value = "/Article/edit")
	    public Article ArticleEdit(Model model,@RequestBody EditorForm editForm) {
			Article article=new Article();
			
			if(editForm.getId()!=null){
				article=service.getArticleById(editForm.getId());
			}else {
				article.setHitCount(0);
				article.setStatus(1);
			}
			article.setTitle(editForm.getTitle());
			article.setAuthor(editForm.getAuthor());
			article.setContents(editForm.getContents());
			article.setTag1(editForm.getTag1());
			article.setTag2(editForm.getTag2());
			article.setTag3(editForm.getTag3());
			article.setTag4(editForm.getTag4());
			article.setImg1(editForm.getImg1());
			article.setImg2(editForm.getImg2());
			article.setImg3(editForm.getImg3());
			
			System.out.println(editForm.getTitle());
			if(editForm.getId()!=null){
				article=service.UpdateArticles(article);
			}else {
				article=service.newArticles(article);
			}
			
	        //return new newArticle("editor" , "editorForm", editorForm);
			return article;
		}
		
//		@PutMapping(value = "/update") 
//		public ResponseEntity<?> UpdateArticlesByIds(Model model,@RequestBody Article article) {
//			  try {
//				    article =service.UpdateArticles(article);
//		            return new ResponseEntity<>(HttpStatus.OK);
//		        } catch (NoSuchElementException e) {
//		            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//		        }
//
//		}
//		
		
//		@RequestMapping(value = "/update/{id}", method=RequestMethod.GET) 
//		public ResponseEntity<EditorForm> UpdateArticlesByIds(@PathVariable("id") Integer id, Map<String, Object> map) {
//		     Map<String, Object> map) {
//		    	    //根據編號獲取到要修改的員工物件
//		    	    EmployeeInfo emp = empDao.getEmpById(id);
//		    	    map.put("employee", emp);
//		    	    
//		    	    //載入所有部門資訊
//		    	    map.put("departments", departDao.getdeparts());
//		    	    
//		    	    return "../input";
//		}

}