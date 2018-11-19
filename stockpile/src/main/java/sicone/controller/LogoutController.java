package sicone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * classe responsavel por receber os parametros de logout da view
 * 
 * @author Dodo
 *
 */

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LogoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();
		
		if ("sair".equals(cmd)) {
			msg = "Sessão encerrada com sucesso!";
	        session.setAttribute("MENSAGEM", msg);
			
	        session.invalidate();
	        
	        response.sendRedirect("./index.jsp");
		}
		
		response.setContentType("text/html");
	}

}
