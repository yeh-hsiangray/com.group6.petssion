package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group6.petssion.backstage.bean.BackstageBeanInterface;
import com.group6.petssion.bean.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {

	Users findByname(String name);
	
	/*
	 * 模糊搜尋名子
	 */
	List<Users> findByNameContains(String name);
	
	Users findByNameAndEmail(String name,String email);
	
	Users findByEmail(String email);
	
	Users findByGarbledAndEmail(String garbled,String email);
	
	Page<Users> findAll(Pageable pageable);
	
	@Query(value="select  * from [dbo].[Users] b where  b.name like %?1% and b.manager!=3", nativeQuery = true)
	Page<Users> findByYear(String name,Pageable pageable);
	@Query(value="select ?1 month,COUNT(*) numeral from USERS where REGDATE like ?2%", nativeQuery = true)
	BackstageBeanInterface findByMonth(String registrationMonth,String registrationMonth2);
	
	@Query(value="select COUNT(*) numeral,b.name jobName from [dbo].[Users] a join [dbo].[Job] b on a.fk_job_id=b.id  group by b.id,b.name order by numeral DESC", nativeQuery = true)
	List<BackstageBeanInterface> findJob();
}
