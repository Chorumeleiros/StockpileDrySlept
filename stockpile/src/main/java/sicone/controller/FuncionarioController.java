package sicone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.FuncionarioDAO;
import sicone.dao.FuncionarioDAOImpl;
import sicone.dao.GenericDAOException;
import sicone.model.Funcionario;

@WebServlet("/FuncionarioC")
public class FuncionarioController extends HttpServlet {
	private static final long serialVersionUID = -7070928034240329418L;

	public FuncionarioController() {
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

		try {

			FuncionarioDAO funcionarioDAO = new FuncionarioDAOImpl();

			if ("adicionar".equals(cmd)) {
				Funcionario funcionario = new Funcionario();
				funcionario.setCpf(request.getParameter("cpf"));
				funcionario.setNome(request.getParameter("nome"));
				funcionario.setPassword(request.getParameter("password"));

				funcionarioDAO.adicionar(funcionario);

				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA", listaFuncionario);
				msg = "Funcion�rio adicionado com sucesso";

			}
			
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao acessar Funcion�rio";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./funcionario.jsp");
	}
}