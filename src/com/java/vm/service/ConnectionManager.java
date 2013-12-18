package com.java.vm.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    static Connection con;
    static String url;
          
    public static Connection getConnection()
    {
      
       try
       {
          String DB_URL = "jdbc:mysql://localhost:3306/javaproject"; 
          Class.forName("com.mysql.jdbc.Driver");
          final String USER = "root";
  			final String PASS = "mysql";
          
          try
          {            	
             con = DriverManager.getConnection(DB_URL,USER,PASS); 
               
          }
          
          catch (SQLException ex)
          {
             ex.printStackTrace();
          }
       }

       catch(ClassNotFoundException e)
       {
          System.out.println(e);
       }

    return con;
}
 }