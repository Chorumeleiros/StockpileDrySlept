package sicone.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.FuncionarioDAO;
import sicone.model.Funcionario;

@WebServlet("/ProdutoController")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = -4057237645388450674L;
	
	public ProdutoController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Voc� n�o tem permiss�o para acessar este conte�do. "
				+ "Para acess�-lo se identifique <a href=\"./index.jsp\">aqui</a>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();
		
		}
}
