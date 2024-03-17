/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

/**
 *
 * @author Admin
 */
import java.io.IOException;  
import java.io.PrintWriter;  
  
import jakarta.servlet.*;  
  
public class MyFilter implements Filter{  
  
public void init(FilterConfig arg0) throws ServletException {}  
      
public void doFilter(ServletRequest req, ServletResponse resp,  
    FilterChain chain) throws IOException, ServletException {  
          
    PrintWriter out=resp.getWriter();  
    
          
    chain.doFilter(req, resp);//sends request to next resource  
     out.print("filter is invoked before"); 
    out.print("filter is invoked after");  
    }  
    public void destroy() {}  
}  
