package com.group6.petssion.blog.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Model.TagVo;
import com.group6.petssion.blog.Repository.ArticleRepository;

@Service
@Transactional
public class ArticleFrontendService_Impl implements ArticleFrontendService{
	@Autowired
	private ArticleRepository articleRepository;

	// -----------------------------------READ------------------------------------
	public Page<Article> getArticlesForSearch(Integer page,Integer size,String search, String type) {
		Page<Article> articles = null;
		Pageable queryPage=PageRequest.of(page, size, Sort.Direction.ASC, "createDate");
		switch (type) {
		case "title":
			articles = articleRepository.getArticlesForSearchTitle(1,search,queryPage);
			break;
		case "author":
			articles = articleRepository.getArticlesForSearchAuthor(1,search,queryPage);
			break;
		case "id":
			articles = articleRepository.getArticleById(1,Integer.parseInt(search),queryPage);
			break;
		case "tag":
			articles = articleRepository.getArticlesForTag(1,search,queryPage);
			break;
		case "createDate":
			articles = articleRepository.getArticlesForSearchCreateDate(1,search,queryPage);
			break;
		}
		if(articles==null) return null;
		if (!articles.isEmpty()) {
			return articles;
		}
		return null;

	}
	public Page<Article> getArticlePageRepository(Integer status,Integer page,Integer size) {
		Article queryArticle=new Article();
		queryArticle.setStatus(status);
		Page<Article> pages=articleRepository.findAll(Example.of(queryArticle),PageRequest.of(page, size, Sort.Direction.ASC, "createDate"));
		return pages;
	}

////原始的controller
//	public List<Article> getAllArticleRepository(Integer page,Integer size) {
//		Article queryArticle=new Article();
//		queryArticle.setStatus(1);
//		Page<Article> pages=articleRepository.findAll(Example.of(queryArticle),PageRequest.of(page, size, Sort.Direction.ASC, "createDate"));
//
//
//		return pages.toList();
//	}
//ajax controller
	public Page<Article> getArticlePageRepository(Integer page,Integer size) {
		Article queryArticle=new Article();
		queryArticle.setStatus(1);
		Page<Article> pages=articleRepository.findAll(Example.of(queryArticle),PageRequest.of(page, size, Sort.Direction.DESC, "createDate"));
		return pages;
	}

	public Page<Article> getArticleHitRepository(Integer page,Integer size) {
		Article queryArticle=new Article();
		queryArticle.setStatus(1);
		Page<Article> pages=articleRepository.findAll(Example.of(queryArticle),PageRequest.of(page, size, Sort.Direction.DESC, "hitCount"));
		return pages;
	}	
	
	public Page<Article> getArticlesForTag(Integer page,Integer size,String tag) {
		Pageable queryPage=PageRequest.of(page, size, Sort.Direction.ASC, "createDate");
		return articleRepository.getArticlesForTag(1,tag,queryPage);
	}
	
	public List<TagVo> getArticleGroupTags() {
//		List<TagVo> queryTags=articleRepository.getArticleGroupTags();
//		Map<String,Integer> resultTagMap=new HashMap<String,Integer>();
//		for(TagVo tag : queryTags) {
//			if(resultTagMap.containsKey(tag.getTag())) {
//				resultTagMap.put(tag.getTag(), resultTagMap.get(tag.getTag())+tag.getCount());		
//			}else {
//				resultTagMap.put(tag.getTag(), tag.getCount());
//			}
//		}
//		List<TagVo> resultTags=new ArrayList<TagVo>();
//		for(String key : resultTagMap.keySet()) {
//			TagVo vo =new TagVo(key,resultTagMap.get(key));
//			resultTags.add(vo);
//		}
//		
		return articleRepository.getArticleGroupTags();
	}
	public Article getArticleById(int id) {
		return articleRepository.findById(id).get();
		}
	
	public Article UpdateArticles(Article inputArticle) {
		return articleRepository.saveAndFlush(inputArticle);
	}

}

