package com.idbi.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.RegestrationBean;
import com.idbi.ServiceImp.RegistrationServiceImp;
import com.idbi.Services.RegistrationService;

public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
        response.setHeader("Pragma", "no-cache"); 
        response.setDateHeader("Expires", 0); 

        PrintWriter out = response.getWriter();
        ErrorBean err = new ErrorBean();
        RequestDispatcher rd = null;
        RegestrationBean registBean = new RegestrationBean();

        try {
            RegistrationService service = new RegistrationServiceImp();

            String ein = request.getParameter("ein") != null ? request.getParameter("ein").trim() : "";
            String empName = request.getParameter("e_name") != null ? request.getParameter("e_name").trim() : "";
            String desination = request.getParameter("desgntn") != null ? request.getParameter("desgntn").trim() : "";
            String email = request.getParameter("e_mail") != null ? request.getParameter("e_mail").trim() : "";
            String mobileno = request.getParameter("mobile_no") != null ? request.getParameter("mobile_no").trim() : "";
            String city = request.getParameter("city") != null ? request.getParameter("city").trim() : "";
            String pincode = request.getParameter("pincode") != null ? request.getParameter("pincode").trim() : "";
            String state = request.getParameter("state") != null ? request.getParameter("state").trim() : "";
            String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";

            // ----------- Empty Field Validation -----------
            String message="";
            if (ein.isEmpty() || empName.isEmpty() || desination.isEmpty() || email.isEmpty() ||
                mobileno.isEmpty() || city.isEmpty() || pincode.isEmpty() || state.isEmpty() || password.isEmpty()) {
            	message="All fields are required!";
                request.setAttribute("fail", message);
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }

            // ----------- Numeric Validation for EIN and PINCODE -----------
            if (!isStringNumeric(ein) || !isStringNumeric(pincode)) {
                request.setAttribute("fail", "EIN and PINCODE must be numeric!");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }

            // ----------- EMAIL Validation -----------
            if (!isValidEmail(email)) {
                request.setAttribute("fail", "Invalid Email Address!");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }

            // ----------- MOBILE NUMBER Validation -----------
            if (!isValidMobile(mobileno)) {
                request.setAttribute("fail", "Invalid Mobile Number! Must be 10 digits.");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }

            // ----------- PASSWORD Validation -----------
            if (!isValidPassword(password)) {
                request.setAttribute("fail", "Password must be at least 8 chars with uppercase, lowercase, number & special character!");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }

            int usereist = service.isUserExist(Integer.parseInt(ein));
            System.out.println("usereist::"+usereist);
            if (usereist>=1) {
                request.setAttribute("fail", "This participats id is already exist, Please use another participats id !");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
                return;
            }
            
            // ----------- Set Data in Bean -----------
            registBean.setEin(Integer.parseInt(ein));
            registBean.setEmpName(empName);
            registBean.setDesination(desination);
            registBean.setEmail(email);
            registBean.setMobileNo(mobileno);
            registBean.setCity(city);
            registBean.setPincode(Integer.parseInt(pincode));
            registBean.setState(state);
            registBean.setPassword(password);

            int count = service.insertUsers(registBean);
            System.out.println("applied>>" + count);

            if (count != 0) {
                request.setAttribute("msg", "Your Registration has Successfully Done!");
            } else {
                request.setAttribute("fail", "Something went wrong! Please try again.");
            }
            request.getRequestDispatcher("Registration.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            err.setErrorMsg("Exception in RegistrationServlet :" + e.getMessage());
            request.setAttribute("err", err);
            rd = request.getRequestDispatcher("Registration.jsp");
            rd.forward(request, response);
        }
    }

    // ---------- Helper Methods ----------

    public static boolean isStringNumeric(String number) {
        try {
            Double.parseDouble(number);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isValidEmail(String email) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return Pattern.matches(regex, email);
    }

    public static boolean isValidMobile(String mobile) {
        // allows only 10 digits
        String regex = "^[0-9]{10}$";
        return Pattern.matches(regex, mobile);
    }

    public static boolean isValidPassword(String password) {
        // at least 8 chars, 1 upper, 1 lower, 1 digit, 1 special char
        String regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return Pattern.matches(regex, password);
    }
}
