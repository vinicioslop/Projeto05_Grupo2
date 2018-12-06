package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Arrays;
import java.util.ArrayList;
import br.com.fatecpg.imobiliaria.User;
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
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("        <link rel=\"icon\" href=\"../../../../favicon.ico\">\n");
      out.write("        <title>Página Inicial - Imobiliária Fatec-PG</title>\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"resource/css/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"resource/css/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"jumbotron.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"jumbotron\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <p>");
      out.write('\n');
      out.write('\n');
  String path = request.getContextPath();
    String user_null = null;
    String errorMessage = null;
    if (request.getParameter("formLogin") != null) {
        user_null="Não é nulo";
        String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        User u = User.getUser(login, pass);

        if (u == null) {
            errorMessage = "Usuário e/ou senha inválido(s)";
        } else {
            session.setAttribute("user", u);
            response.sendRedirect(request.getRequestURI());
        }

    }
    if (request.getParameter("formLoggoff") != null) {
        session.removeAttribute("user");
        response.sendRedirect(request.getRequestURI());
    }

      out.write("\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("<meta name=\"description\" content=\"\">\n");
      out.write("<meta name=\"author\" content=\"\">\n");
      out.write("<link rel=\"icon\" href=\"../../../../favicon.ico\">\n");
      out.write("<link href=\"resource/css/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"resource/css/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("<!-- Custom styles for this template -->\n");
      out.write("<link href=\"jumbotron.css\" rel=\"stylesheet\">\n");
 if (errorMessage != null) {
      out.write("\n");
      out.write("<h3 style=\"color: red\">");
      out.print( errorMessage);
      out.write("</h3>\n");
 } 
      out.write('\n');
 if (session.getAttribute("user") == null) { 
      out.write("\n");
      out.write("<div class=\"jumbotron\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("    <form method=\"post\">\n");
      out.write("        <h1 class=\"display-3\">Imobiliária</h1>\n");
      out.write("        <p>Seja Bem- Vindo! Faça login para acessar:</p>\n");
      out.write("        Login <input type=\"text\" name=\"login\" />\n");
      out.write("        Pass: <input type=\"password\" name=\"pass\" />\n");
      out.write("        <input type=\"submit\" name=\"formLogin\" value=\"Entrar\" class=\"btn botaoForm mb-4\"/>\n");
      out.write("    </form>\n");
      out.write("    <hr/>\n");
      out.write("    </div>    \n");
      out.write("</div>      \n");
if(user_null==null){
      out.write("\n");
      out.write("<center>\n");
      out.write("<div class=\"container\">\n");
      out.write("<a href=\"");
      out.print( path);
      out.write("/home.jsp\">Inicio</a>\n");
      out.write("|| <a href=\"");
      out.print( path);
      out.write("/compra_null.jsp\" >Compra de Imóveis</a>\n");
}
      out.write("\n");
      out.write("</div></center>\n");
 } else { 
      out.write("\n");
      out.write("<div class=\"jumbotron\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <form method=\"post\">\n");
      out.write("        <h3 class=\"display-3\">\n");
      out.write("            ");
 User user = (User) session.getAttribute("user");
      out.write("\n");
      out.write("            Bem vindo(a), ");
      out.print( user.getName());
      out.write("</h3> <br>\n");
      out.write("        <p>Cargo: ");
      out.print( user.getRole());
      out.write("</p>\n");
      out.write("        <input type=\"submit\" name=\"formLoggoff\" value=\"Sair\" class=\"btn botaoForm mb-4\"/><center><p>\n");
      out.write("                <a href=\"");
      out.print( path);
      out.write("/home.jsp\">Inicio</a>\n");
      out.write("                || <a href=\"");
      out.print( path);
      out.write("/compra.jsp\" >Compra de Imóveis</a>\n");
      out.write("                ");
 if (user.getRole().equals("ADMIN")) {
      out.write("\n");
      out.write("                || <a href=\"");
      out.print( path);
      out.write("/admin/gerenciamento.jsp\" >Gerenciamento do Site</a>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </p></center>\n");
      out.write("            ");
 }
      out.write("\n");
      out.write("            <hr/></form>\n");
      out.write("    </div>    \n");
      out.write("</div>");
      out.write("</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <main role=\"main\">\n");
      out.write("            <div class=\"row mb-5\">\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <div class=\"card\">   \n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h4 class=\"card-title\">Ana Paula</h4>                        \n");
      out.write("                            <p class=\"card-text\"> \n");
      out.write("\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"card-footer text-muted\">\n");
      out.write("                            Integrante da Equipe\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <div class=\"card\">   \n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h4 class=\"card-title\">Nicole Medina</h4>                        \n");
      out.write("                            <p class=\"card-text\">\n");
      out.write("\n");
      out.write("                            </p>\n");
      out.write("                        </div>   \n");
      out.write("\n");
      out.write("                        <div class=\"card-footer text-muted\">\n");
      out.write("                            Integrante da Equipe\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <div class=\"card\">   \n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h4 class=\"card-title\">Vinícius Lopes</h4>                        \n");
      out.write("                            <p class=\"card-text\"> \n");
      out.write("\n");
      out.write("                            </p>\n");
      out.write("                        </div>   \n");
      out.write("\n");
      out.write("                        <div class=\"card-footer text-muted\">\n");
      out.write("                            Integrante da Equipe\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("        <br><br><br>\n");
      out.write("    <center><footer class=\"container\">\n");
      out.write("            <p>&copy; Fatec Praia Grande-2018</p>\n");
      out.write("        </footer></center>\n");
      out.write("\n");
      out.write("    <!-- JS -->\n");
      out.write("    <script src=\"resource/css/js/jquery-3.3.1..min.map\" ></script>\n");
      out.write("    <script>window.jQuery || document.write('<script src=\"../../assets/js/vendor/jquery-slim.min.js\"><\\/script>')</script>\n");
      out.write("    <script src=\"../../assets/js/vendor/popper.min.js\"></script>\n");
      out.write("    <script src=\"resource/css/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
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
