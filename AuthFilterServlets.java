package com.idbi.Servlets;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization if required
    	System.out.println("::::::::::::::::::Filter Initialization:::::::::::");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        System.out.println("::::::::::::::::::Filter doFilter:::::::::::");
        String ein = request.getParameter("ein");
        System.out.println(":::"+ein);
        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        System.out.println("URI:::"+uri+"::::::::::::::::::User session:::::::::::");
        System.out.println("session:::"+session+"::::::::::::::::::User session:::::::::::");
        // Allow login and static resources without session check
        if ((session != null ) && (uri.endsWith("Login.jsp") || uri.endsWith("LoginServlet") || uri.endsWith("logout")  || uri.endsWith("/style.css")  || uri.endsWith("Registration"))) {        	
            chain.doFilter(request, response); // go ahead
        } else { // Check session
            if ((session == null || session.getAttribute("user") == null) && (uri.endsWith("OnlineExamPortal/") )) {
                // No session -> redirect to login
                res.sendRedirect(req.getContextPath() + "/Login.jsp");
            } else { // Session valid -> continue            
            	// prevent caching for protected pages
                res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
                res.setHeader("Pragma", "no-cache"); // HTTP 1.0
                res.setDateHeader("Expires", 0); // Proxies
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
        // Cleanup if required
    	System.out.println("::::::::::::::::::Filter destroy:::::::::::");
    }
}
