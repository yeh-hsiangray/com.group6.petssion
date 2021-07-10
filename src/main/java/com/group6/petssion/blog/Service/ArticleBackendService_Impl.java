package com.group6.petssion.blog.Service;

import java.util.Date;
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
public class ArticleBackendService_Impl implements ArticleBackendService{
	
	@Autowired
	private ArticleRepository articleRepository;

	// -----------------------------------READ------------------------------------
	public Page<Article> getArticlesForSearch(Integer page,Integer size,String search, String type,boolean sortOrder) {
		Page<Article> articles = null;
		Pageable queryPage=PageRequest.of(page, size, sortOrder?Sort.Direction.ASC:Sort.Direction.DESC, "createDate");
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
	public Page<Article> getArticlesForSearchInBin(Integer page,Integer size,String search, String type, boolean sortOrder) {
		Page<Article> articles = null;
		Pageable queryPage=PageRequest.of(page, size, sortOrder?Sort.Direction.ASC:Sort.Direction.DESC, "updateDate");
		switch (type) {
		
		case "title":
			articles = articleRepository.getArticlesForSearchTitle(0,search,queryPage);
			break;
		case "author":
			articles = articleRepository.getArticlesForSearchAuthor(0,search,queryPage);
			break;
		case "id":
			articles = articleRepository.getArticleById(0, Integer.parseInt(search),queryPage);
			break;
		case "tag":
			articles = articleRepository.getArticlesForTag(0,search,queryPage);
			break;
		case "updateDate":
			articles = articleRepository.getArticlesForSearchCreateDate(0,search,queryPage);
			break;
		}
		if(articles==null) return null;
		if (!articles.isEmpty()) {
			return articles;
		}
		return null;

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
	public Page<Article> getArticlePageRepository(Integer status,Integer page,Integer size) {
		Article queryArticle=new Article();
		queryArticle.setStatus(status);
		Page<Article> pages=articleRepository.findAll(Example.of(queryArticle),PageRequest.of(page, size, Sort.Direction.DESC, "createDate"));
		return pages;
	}
	public Article getArticleById(int id) {
		return articleRepository.findById(id).get();
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

	

	// ------------------------------------DELETE------------------------------------
	public void deleteArticlesById(Integer id) {
		articleRepository.deleteById(1);
	}

	public void deleteArticlesByIds(List<Integer> ids) {
		articleRepository.deleteArticlesByIds(ids);
	}
	
	// ------------------------------------CREATE------------------------------------
	public Article newArticles(Article inputArticle) {
		Article article = new Article();
		article.setTitle(inputArticle.getTitle());
		article.setAuthor(inputArticle.getAuthor());
		article.setTag1(inputArticle.getTag1());
		article.setTag2(inputArticle.getTag2());
		article.setTag3(inputArticle.getTag3());
		article.setTag4(inputArticle.getTag4());
		article.setContents(inputArticle.getContents());
		article.setImg1(inputArticle.getImg1());
		article.setImg2(inputArticle.getImg2());
		article.setImg3(inputArticle.getImg3());
		article.setHitCount(inputArticle.getHitCount());
		article.setStatus(inputArticle.getStatus());
		article.setCreateDate(new Date());
		article.setUpdateDate(new Date());
		return articleRepository.save(article);
	}

	// ------------------------------------UPDATE------------------------------------
	//controller send
	public Article UpdateArticles(Article inputArticle) {
		Article article = articleRepository.getById(inputArticle.getId());
		article.setTitle(inputArticle.getTitle());
		article.setAuthor(inputArticle.getAuthor());
		article.setContents(inputArticle.getContents());
		article.setTag1(inputArticle.getTag1());
		article.setTag2(inputArticle.getTag2());
		article.setTag3(inputArticle.getTag3());
		article.setTag4(inputArticle.getTag4());
		article.setImg1(inputArticle.getImg1());
		article.setImg2(inputArticle.getImg2());
		article.setImg3(inputArticle.getImg3());
		article.setHitCount(inputArticle.getHitCount());
		article.setStatus(inputArticle.getStatus());
		article.setUpdateDate(new Date());
		return articleRepository.saveAndFlush(article);
	}
	public void updateArticleStatusByIds(List<Integer> ids,Integer sourceStatus,Integer targetStatus) {
		articleRepository.updateArticleStatusByIds(ids,sourceStatus,targetStatus);
	}
	//    //send one by one
	//    public Article UpdateArticles(Integer id ,String title,String author,String content,String tag1){
	//    	Article article =articleRepository.getById(id);
	//    	article.setTitle(title);
	//    	article.setAuthor(author);
	//    	article.setContents(content);
	//    	article.setTag1(tag1);
	//    	article.setUpdateDate(new Date());
	//        return articleRepository.saveAndFlush(article);
	//    }
	@Override
	public Long getTotalHitCount() {
		return articleRepository.getTotalHitCount();
	}

}