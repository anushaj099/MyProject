/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.empdto;
import com.textile.model.Employee;
import com.textile.model.Login;
import com.textile.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class EmployeeManager {

    public empdto insertEmp(empdto e) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        int eid = e.getEid();
        String ename = e.getEname();
        String desg = e.getDesg();
        try {
            Employee emp = new Employee();
            emp.setEmpId(eid);
            emp.setEmpName(ename);
            emp.setDesignation(desg);
            s.save(emp);
            t.commit();
        } catch (Exception ex) {

        }
        return e;
    }

    public List empList(empdto rf) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        List<Login> list = null;
        System.out.println("list is-------------" + rf.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", rf.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List empList1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public boolean validateUser(empdto l) {
        System.out.println("---------home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        int eid = l.getEid();
        Criteria c = session.createCriteria(Employee.class);
        c.add(Restrictions.eq("empId", eid)).uniqueResult();
        List<Login> list = c.list();
        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }

    public List<empdto> display() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List l = null;
        Criteria c = session.createCriteria(Employee.class);
        l = c.list();
        t.commit();
        return l;
    }

    public List<empdto> empEdit(int id1) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List l = null;
        try {
            Criteria c = session.createCriteria(Employee.class);
            c.add(Restrictions.eq("empId", id1)).uniqueResult();
            l = c.list();
            System.out.println("\n dddddddddddddddddd" + l);
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during edit" + h);
        } catch (Exception e) {
            System.out.println("Exception during edit" + e);
        } finally {
            //session.close();
        }
        return l;
    }

    public void empDelete(int id1) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        try {
            Employee e = new Employee();
            Criteria c = session.createCriteria(Employee.class);
            e = (Employee) c.add(Restrictions.eq("empId", id1)).uniqueResult();
            session.delete(e);
            t.commit();
            System.out.println("\n Deleted Successfully");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during Delete" + h);
        } catch (Exception e) {
            System.out.println("Exception during Delete" + e);
        } finally {
            session.close();
        }
    }

    public void empUpdate(int eid, String ename, String desg) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Employee emp = new Employee();
            emp.setEmpId(eid);
            emp.setEmpName(ename);
            emp.setDesignation(desg);
            s.update(emp);
            s.flush();
            s.clear();
            t.commit();
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during Update" + h);
        } catch (Exception e1) {
            System.out.println("Exception during update" + e1);
        } finally {
            s.close();
        }
    }

}
