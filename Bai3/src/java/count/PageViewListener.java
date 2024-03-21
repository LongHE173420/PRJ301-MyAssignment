/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package count;

import dal.CountDBContext;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class PageViewListener implements ServletRequestListener {

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
       CountDBContext count=new CountDBContext();
       int viewCount=count.getViewCount();
       viewCount++;
       count.insertCount(viewCount);
       sre.getServletContext().setAttribute("viewCount", viewCount);
        
        
    }

    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        // Not used in this case
    }
}
