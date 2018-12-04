package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.com.fatecpg.imobiliaria.User;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/jspf/header.jspf");
  }

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
      out.write("        <title>Página Inicial - WebParking</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write('\n');
      out.write('\n');
  String path = request.getContextPath();
    String errorMessage = null;
    if (request.getParameter("formLogin") != null){
        String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        User u = User.getUser(login, pass);
        
        if (u == null) {
            errorMessage = "Usuário e/ou senha inválido(s)";
        } else{
            session.setAttribute("user", u);
            response.sendRedirect(request.getRequestURI());
        }
        
    }
    if (request.getParameter("formLoggoff") != null){
        session.removeAttribute("user");
        response.sendRedirect(request.getRequestURI());
    }

      out.write("\n");
      out.write("<h1>Parking WebApp</h1>\n");
 if (errorMessage != null) { 
      out.write("\n");
      out.write("    <h3 style=\"color: red\">");
      out.print( errorMessage );
      out.write("</h3>\n");
 } 
      out.write('\n');
 if(session.getAttribute("user") == null){ 
      out.write("\n");
      out.write("    <form method=\"post\">\n");
      out.write("        Login <input type=\"text\" name=\"login\" />\n");
      out.write("        Pass: <input type=\"password\" name=\"pass\" />\n");
      out.write("        <input type=\"submit\" name=\"formLogin\" value=\"Entrar\" />\n");
      out.write("    </form>\n");
 } else { 
      out.write("\n");
      out.write("    <form>\n");
      out.write("        ");
 User user = (User) session.getAttribute("user"); 
      out.write("\n");
      out.write("        Bem vindo, ");
      out.print( user.getName() );
      out.write(" <br>\n");
      out.write("        Cargo: ");
      out.print( user.getRole());
      out.write("\n");
      out.write("        <input type=\"submit\" name=\"formLoggoff\" value=\"Sair\" />\n");
      out.write("    </form>\n");
      out.write("    <h2>\n");
      out.write("        <a href=\"");
      out.print( path );
      out.write("/index.jsp\">Inicio</a>\n");
      out.write("        ");
 if (user.getRole().equals("ADMIN")) { 
      out.write("\n");
      out.write("            || <a href=\"");
      out.print( path );
      out.write("/admin/users.jsp\" />Usuários</a>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </h2>\n");
 } 
      out.write("\n");
      out.write("<hr/>");
      out.write("\n");
      out.write("        <h1>Página inicial</h1>  \n");
      out.write("    </body>\n");
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
