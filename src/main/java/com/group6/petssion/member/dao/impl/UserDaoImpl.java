package com.group6.petssion.member.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.Users;

@Repository
public class UserDaoImpl {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public void updateUser(Users user) {
		entityManager.clear();
		entityManager.merge(user);
	}
	
	
//	@Override
	@SuppressWarnings("unchecked")
	public List<Users> findUserByUserId(int userId) {
		String hql = "from Users p where p.id=:id";
		List<Users> list = new ArrayList<Users>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}

	public boolean isUsersExist(Users user) {
		boolean exist = false;
		String hql = "from Users p where p.id=:id";
		try {
			entityManager.createQuery(hql).setParameter("id", user.getId()).getSingleResult();
			exist = true;
		} catch (NoResultException e) {
			;
		}
		return exist;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> getAllUserNameByUserId(int userId) {
		String hql = "select p.name from Users p where p.id=:id";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}

	
	public void detachJob(Job job) {
		entityManager.detach(job);
	}
	
	public void detachHobby(List<Hobby> list) {
		entityManager.detach(list);
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByName(String searchWord) {
		String hql =  "from Users u where u.name like'%"+searchWord+"%'"; 
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByGender(String searchWord) {
		String hql =  "from Users u where u.gender like'%"+searchWord+"%'"; 
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByAddress(String searchWord) {
		String hql =  "from Users u where u.address like'%"+searchWord+"%'"; 
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByMobilephone(String searchWord) {
		String hql =  "from Users u where u.mobilephone like'%"+searchWord+"%'"; 
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByEmail(String searchWord) {
		String hql =  "from Users u where u.email like'%"+searchWord+"%'";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByBlockade(String searchWord) {
		String hql =  "from Users u where u.Blockade like'%"+searchWord+"%'";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByJob(String searchWord) {
		String hql = "select u from Users u left join u.job uj where uj.name =:jobName";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).setParameter("jobName", searchWord).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByHobby(String searchWord) {
		String hql = "select u from Users u left join u.hobby uh where uh.name =:hobbyName";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).setParameter("hobbyName", searchWord).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByBirth(String searchWord) {
		String hql =  "from Users u where u.birthday like'%"+searchWord+"%'";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> searchUserByRegdate(String searchWord) {
		String hql =  "from Users u where u.regdate like'%"+searchWord+"%'";
		List<Users> list = new ArrayList<>();
		try {
			list = (List<Users>) entityManager.createQuery(hql).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
}
