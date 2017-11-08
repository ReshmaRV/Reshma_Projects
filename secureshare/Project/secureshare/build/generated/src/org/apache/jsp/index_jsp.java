package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<title>SECshare</title>\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/layout.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<script type=\"text/javascript\" src=\"css/jquery-1.6.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"css/jquery.easing.1.3.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"css/tms-0.3.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"css/tms_presets.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"css/script.js\"></script>\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reveal.css\"/>\n");
      out.write("<script type=\"text/javascript\" src=\"css/jquery-1.6.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"css/jquery.reveal.js\"></script>\n");
      out.write("<script>\n");
      out.write("    function message(){\n");
      out.write("        alert(\"Contact number will be your default authentication password..\");\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body id=\"page1\">\n");
      out.write("<div class=\"body1\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("    <!--header -->\n");
      out.write("    <!--<a href=\"#\" class=\"big-link\" data-reveal-id=\"signup\">-->\n");
      out.write("    <header>\n");
      out.write("      <div class=\"wrapper\">\n");
      out.write("        <h1><a href=\"#\">Firepop Secure your shares</a></h1>\n");
      out.write("        <nav>\n");
      out.write("          <ul id=\"menu\">\n");
      out.write("            <li><a href=\"#\" class=\"big-link\" data-reveal-id=\"myModal\">Login</a></li>\n");
      out.write("            <li><a href=\"#\" class=\"big-link\" data-reveal-id=\"signup\">Sign up</a></li>\n");
      out.write("          </ul>\n");
      out.write("        </nav>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"slider_bg\">\n");
      out.write("        <div class=\"slider\">\n");
      out.write("            <img src=\"images/homeimg.png\"/>\n");
      out.write("          <ul class=\"items\">\n");
      out.write("            <li><img src=\"images/homeimg.png\" alt=\"\"/></li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("    <!-- / header -->\n");
      out.write("    <!-- content -->\n");
      out.write("    <article id=\"content\">\n");
      out.write("      <div class=\"wrapper\">\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("    </article>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("    <!--pop up window login div starts-->\n");
      out.write("    <div id=\"myModal\" class=\"reveal-modal\" style=\"color: #000\">\n");
      out.write("        <center>\n");
      out.write("        <h4>MEMBER LOGIN </h4><br/>\n");
      out.write("        <form name=\"login\" action=\"process/loginpr.jsp\" method=\"post\">\n");
      out.write("            <table cellpadding=\"20\" columnpadding=\"10\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Username</td>\n");
      out.write("                    <td>&nbsp;&nbsp;<input type=\"text\" name=\"username\" id=\"username\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td>&nbsp;&nbsp;<input type=\"password\" name=\"upassword\" id=\"password\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"right\"><input type=\"submit\" value=\"Login\"/></td>\n");
      out.write("                </tr>                            \n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        </center>\n");
      out.write("    </div>\n");
      out.write("    <!--pop up window login div ends-->\n");
      out.write("    <!--pop up window signup div starts-->\n");
      out.write("    <div id=\"signup\" class=\"reveal-modal\" style=\"color: #000\">\n");
      out.write("        <center>\n");
      out.write("        <h4>SIGN UP HERE </h4><br/>\n");
      out.write("        <form name=\"signup\" action=\"process/signup_pr.jsp\" method=\"post\">\n");
      out.write("            <table>\n");
      out.write("                <tr> <td>Name</td>           <td><input type=\"text\" name=\"name\" id=\"name\"/></td> </tr>\n");
      out.write("                <tr> <td>Birth day</td>  <td><input type=\"date\" name=\"dob\" id=\"dob\"/></td> </tr>\n");
      out.write("                <tr> <td>Email</td>         <td><input type=\"email\" name=\"email\" id=\"email\"/></td></tr>\n");
      out.write("                <tr> <td>Contact</td>           <td><input type=\"text\" name=\"contact\" id=\"contact\" onclick=\"message()\"/></td> </tr>\n");
      out.write("                <tr> <td>Address</td>           <td><textarea name=\"address\" id=\"address\" rows=\"5\" cols=\"21\"></textarea></td> </tr>\n");
      out.write("                <tr> <td>Place</td>           <td><input type=\"text\" name=\"place\" id=\"place\"/></td> </tr>\n");
      out.write("                <tr> <td>Username</td>           <td><input type=\"text\" name=\"username\" id=\"username\"/></td> </tr>\n");
      out.write("                <tr> <td>Password</td>           <td><input type=\"password\" name=\"upassword\" id=\"password\"/></td> </tr>\n");
      out.write("                <tr><td>Security question</td>  <td><select name=\"secQ\">\n");
      out.write("                                                    <option value=\"0\" selected=\"\">--select--</option>\n");
      out.write("                                                    <option value=\"1\">Your first mobile number</option>\n");
      out.write("                                                    <option value=\"2\">Your most liked moment</option>\n");
      out.write("                                                    <option value=\"3\">Name of first teacher</option>\n");
      out.write("                                                    </select></td></tr>\n");
      out.write("                <tr> <td>Answer</td>    <td><input type=\"text\" name=\"ans\" id=\"ans\" width=\"300\"/></td> </tr>\n");
      out.write("                <tr> <td colspan=\"2\" align=\"right\"><input type=\"submit\" value=\"Sign up\"</td>   </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        </center>\n");
      out.write("    </div>\n");
      out.write("    <!--pop up window signup div ends-->\n");
      out.write("<div class=\"body2\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("   \n");
      out.write("    <!-- / content -->\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"main\">\n");
      out.write("  <!-- footer -->\n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("<!--<div align=center> <a href='#'>LCC Computer Education, Marine drive, Kochi</a></div></body>-->\n");
      out.write("</html>");
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
