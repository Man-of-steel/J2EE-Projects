/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;

/**
 *
 * @author Man of Steel
 */
public class Student {
    
    private String id, name, password, email, number;

    public Student() {
    }

    public Student(String id, String name, String password, String email, String number) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.number = number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
    
    public static Student isStudent(String studentId, String password){
    	Student u = null;
        try{
            String sql = "select * from student_tbl where student_id = '"+studentId+"' and password = '"+password+"'";
            ResultSet rs = new dao.DAO().getData(sql);
            if(rs.next()){
                u = new Student();
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("student_name"));
                //u.setPassword(rs.getString("password"));
                u.setNumber(rs.getString("number"));
                u.setId(rs.getString("student_id"));
            }
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return u;
    }
    
}
