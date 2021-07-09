package com.group6.petssion.blog.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Model.TagVo;

@Service
@Transactional
public interface ArticleBackendService {

	// -----------------------------------READ------------------------------------
	public Page<Article> getArticlesForSearch(Integer page, Integer size, String search, String type, boolean sortOrder);
	public Page<Article> getArticlesForSearchInBin(Integer page, Integer size, String search, String type, boolean sortOrder);

//	List<Article> getAllArticleRepository(Integer page, Integer size);

	
	public Page<Article> getArticlePageRepository(Integer status,Integer page,Integer size);

	List<TagVo> getArticleGroupTags();

	public Page<Article> getArticlesForTag(Integer page, Integer size, String tag);

	Article getArticleById(int id);

	// ------------------------------------DELETE------------------------------------
	void deleteArticlesById(Integer id);

	void deleteArticlesByIds(List<Integer> ids);
	
	public void updateArticleStatusByIds(List<Integer> ids,Integer sourceStatus,Integer targetStatus);

	// ------------------------------------CREATE------------------------------------
	Article newArticles(Article inputArticle);

	// ------------------------------------UPDATE------------------------------------
	// controller send
	Article UpdateArticles(Article inputArticle);
	Long getTotalHitCount();
}
