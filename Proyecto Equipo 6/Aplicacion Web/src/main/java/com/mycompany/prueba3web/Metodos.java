/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prueba3web;

/**
 *
 * @author alana
 */
public class Metodos 
{
  public static boolean isNumeric (String str)
  {
      try
      {
          Double.parseDouble(str);
          return true;
      }
      catch(NumberFormatException e)
      {
          return false;
      }
  }
    
}
