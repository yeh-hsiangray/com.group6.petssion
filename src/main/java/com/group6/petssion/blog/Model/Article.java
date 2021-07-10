package com.group6.petssion.blog.Model;

import java.util.Date;
import javax.persistence.*;


@Entity
@Table(name="BLOG")
@NamedNativeQuery(
	    name="Article.getArticleGroupTags"
	    , query="select _tmp.tag,sum(_tmp.ct) count from ( select tag1 as tag,count(1) as ct from BLOG b where b.data_status=1 group by tag1 "
				+ "union "
				+ "select tag2 as tag,count(1) as ct from BLOG b where b.data_status=1 group by tag2 "
				+ "union "
				+ "select tag3 as tag,count(1) as ct from BLOG b where b.data_status=1 group by tag3 "
				+ "union "
				+ "select tag4 as tag,count(1) as ct from BLOG b where b.data_status=1 group by tag4) _tmp group by _tmp.tag"
	    , resultClass =TagVo.class
	) 
public class Article {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	
	String title;
	String author;
	String tag1;
	String tag2;
	String tag3;
	String tag4;
	String contents;
	String img1;
	String img2;
	String img3;
	@Column(name="data_status",nullable = true)
	Integer status;
 
	@Column(name="create_date" ,nullable = true)
	Date createDate;

	@Column(name="update_date" ,nullable = true)
	Date updateDate;
	@Column(name="hit_count",nullable = true)
	Integer hitCount;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getHitCount() {
		return hitCount;
	}
	public void setHitCount(Integer hitCount) {
		this.hitCount = hitCount;
	}
	

	
}
