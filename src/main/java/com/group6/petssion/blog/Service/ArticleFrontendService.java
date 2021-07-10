package com.group6.petssion.blog.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Model.TagVo;

@Service
@Transactional
public interface ArticleFrontendService {
	
	// -----------------------------------READ------------------------------------
	/**
	 * 
	 * @param page
	 * @param size
	 * @param search
	 * @param type
	 * @return
	 */
	public Page<Article> getArticlesForSearch(Integer page,Integer size,String search, String type) ;

//	List<Article> getAllArticleRepository(Integer page,Integer size);
	
	public Page<Article> getArticlePageRepository(Integer page,Integer size);
	public Page<Article> getArticleHitRepository(Integer page,Integer size);


	List<TagVo> getArticleGroupTags();

	public Page<Article> getArticlesForTag(Integer page,Integer size,String tag) ;
	
	Article getArticleById(int id);
	
	public Article UpdateArticles(Article inputArticle) ;
}
