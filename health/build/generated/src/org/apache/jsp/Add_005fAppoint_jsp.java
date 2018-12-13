package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Add_005fAppoint_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            int id=(int)session.getAttribute("D_id");
            String Odate=request.getParameter("dateToday");
            String pname=request.getParameter("firstname");
            String cont=request.getParameter("contact");
            String dis=request.getParameter("disease");
            String day=request.getParameter("usr_day");
            String loc1=request.getParameter("location");
            pkg3.PatientAppointment obj=new pkg3.PatientAppointment();
            obj.setP_name(pname);
            obj.setP_contact(cont);
           obj.setP_disease(dis);
           obj.setP_apt_date(Odate);
           obj.setP_apt_day(day);
           obj.setD_id(id);
           obj.setL_name(loc1);
           pkg3.PatientAppointmentDAO Dobj=new pkg3.PatientAppointmentDAO();
            Dobj.Insert_PatientAppointment(obj);
            
            
            //String token[]=Odate.split("/");
            //String result=token[2]+"-"+token[1]+"-"+token[0];
            out.println("<h1 align=center>Your Appointment Is Saved.</h1>") ;
            
            
        
      out.write("\n");
      out.write("        <br><a size=\"5\" href='mainPage.html' >Home Page</a>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
