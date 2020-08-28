/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prueba3web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Equipo 6 Base de Datos | FCFM | UANL
 */
public class DbConnection 
{
    private static Connection con = null;
    // Quitar puerto si no se puede
    private static String connectionURL = "jdbc:sqlserver://LAPTOP-41RP8IC0\\SQLEXPRESS:1433;"
            + "databaseName=JavaWeb;"
            + "user = usuarioSQL;"
            + "password = 1234; ";
    private static final String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public Connection getConn ()
    {
        try 
        {
            Class.forName(driver);
            con = DriverManager.getConnection(connectionURL);
        } catch (ClassNotFoundException | SQLException e) 
        {
           System.out.println(e);
        }
        if (con == null)
        {
            System.out.println("Nulo");
        }
        return con;
    }
    
    public void closeConn () throws SQLException
    {
        con.close();
    }
}
