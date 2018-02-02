/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DAO;
import java.sql.ResultSet;

/**
 *
 * @author Man of Steel
 */
public class Admin {
    
    private String username, password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public static boolean isAdmin(String username, String password){
        boolean flag = false;
        try{
            DAO dao = new DAO();
            String sql = "select * from admin_tbl where username = '"+username+"' and password = '"+password+"'";
            System.out.println("Username " + username + " password "+ password);
            ResultSet rs = dao.getData(sql);
            if(rs.next())
                flag = true;            
        }
        catch(Exception e){e.printStackTrace();}
        
        return flag;
    }
    
}
