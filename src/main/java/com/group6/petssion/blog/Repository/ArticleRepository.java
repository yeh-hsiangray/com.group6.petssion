package com.group6.petssion.blog.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.group6.petssion.blog.Model.Article;
import com.group6.petssion.blog.Model.TagVo;
@Repository
public interface ArticleRepository extends JpaRepository<Article,Integer> {
	
	// -----------------------------------READ------------------------------------
	@Query("Select b from Article b where b.status=?1 and author like CONCAT('%',?2,'%')")	
	public Page<Article> getArticlesForSearchAuthor(Integer status,String search,Pageable page);
	
	@Query("Select b from Article b where b.status=?1 and title like CONCAT('%',?2,'%')")
	public Page<Article> getArticlesForSearchTitle(Integer status,String search,Pageable page);
	
	@Query("Select b from Article b where b.status=?1 and FORMAT(b.createDate,'yyyyMMdd')=?2")
	public Page<Article> getArticlesForSearchCreateDate(Integer status,String search,Pageable page);
	
	@Query("Select b from Article b where b.status=1")
	public List<Article> getAllArticle(String allArtcile);
	
	@Query("Select b from Article b where b.status=?1 and id = ?2")
	public Page<Article> getArticleById(Integer status,Integer id,Pageable page);
	
	@Query("Select b from Article b where b.status=?1 and (tag1=?2 or tag2=?2 or tag3=?2 or tag4=?2)")
	public Page<Article> getArticlesForTag(Integer status,String tag,Pageable page);
		
	@Query(nativeQuery=true)
	public List<TagVo> getArticleGroupTags();
	
	@Query("Select b from Article b where b.status=1 order by b.createDate desc")
	public Article getLastestArticles(String LastestArticle);
	
	@Query("Select sum(b.hitCount) from Article b where b.status=1 ")
	public Long getTotalHitCount();
	
	@Modifying
	@Query("update Article b set b.status=?3 WHERE id in (?1) and b.status=?2")
    public void updateArticleStatusByIds(List<Integer> ids,Integer sourceStatus,Integer targetStatus);
//	@Query("select tag,sum(count) from ("
//			+ "select tag1 as tag,count(1) as count from blog group by tag1"
//			+ "union"
//			+ "select tag2 as tag,count(1) as count from blog group by tag2"
//			+ "union"
//			+ "select tag3 as tag,count(1) as count from blog group by tag3"
//			+ "union"
//			+ "select tag4 as tag,count(1) as count from blog group by tag4) _tmp group by tag")
	
	
	// ------------------------------------DELETE------------------------------------
//	@Modifying
//	@Query("DELETE FROM BLOG WHERE ARTICLE_ID = ?1")
//	public void deleteArticlesById(Integer id);
	
	@Modifying
	@Query("DELETE FROM Article WHERE id in (?1)")
    public void deleteArticlesByIds(List<Integer> ids);

   
	// ------------------------------------CREATE------------------------------------
	
	
	
	// ------------------------------------UPDATE------------------------------------
//	@Modifying
//	@Query("UPDATE BLOG SET title=?, author=?, tag1=?, tag2=?, tag3=?, tag4=?, contents=?,img1=?,img2=?,img3=? WHERE Article_Id=?")
//    public Object UpdateArticlesByIds(Integer id);

}