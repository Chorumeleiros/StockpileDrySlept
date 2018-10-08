package sicone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FuncionarioController extends HttpServlet {
	private static final long serialVersionUID = -7070928034240329418L;

    public FuncionarioController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Para acessar utilize a página <a href=\"./funcionario.jsp\">Funcionário</a>");
		//melhorar a resposta
	}
}
