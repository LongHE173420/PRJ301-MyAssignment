/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package count;

/**
 *
 * @author Admin
 */
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class PageViewListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {       
        sce.getServletContext().setAttribute("viewCount", 0);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}

