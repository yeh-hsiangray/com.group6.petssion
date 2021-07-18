package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group6.petssion.backstage.bean.BackendUserBeanInterface;
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
	
	@Query(value="select u.id,a.account,u.name,u.email,u.gender,j.name jobName,u.birthday,u.manager,u.Blockade from [dbo].[Users] u left join [dbo].[Job] j\r\n"
			+ "on j.id=u.fk_job_id   left join [dbo].[account_password] a on u.id=a.fk_users_id where u.name like %?% and u.manager!=3", nativeQuery = true)
	Page<BackendUserBeanInterface> findByName(String name,Pageable pageable);
	@Query(value="select ?1 month,COUNT(*) numeral from USERS where REGDATE like ?2%", nativeQuery = true)
	BackstageBeanInterface findByYearOrMonth(String registrationMonth,String registrationMonth2);
	
	@Query(value="select COUNT(*) numeral,b.name jobName from [dbo].[Users] a join [dbo].[Job] b on a.fk_job_id=b.id  group by b.id,b.name order by numeral DESC", nativeQuery = true)
	List<BackstageBeanInterface> findJob();
	
	 @Query(nativeQuery = true,value="select *from [dbo].[Users]  where id in (select users_id from [dbo].[Users_hobby] where hobby_id=?1) and id not in (select user_b from [dbo].[MatchStatus] where user_A=?2)")
	 List<Users> findByUserBAndUserA(Integer id,Integer UserAId);
}
