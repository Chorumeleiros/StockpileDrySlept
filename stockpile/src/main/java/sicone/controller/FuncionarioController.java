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
import sicone.model.Produto;
import sicone.model.UserInfo;

/**
 * classe responsavel por receber os parametros do funcionario da view
 * 
 * @author Dodo
 *
 */

@WebServlet("/FuncionarioC")
public class FuncionarioController extends HttpServlet {
	private static final long serialVersionUID = -7070928034240329418L;

	public FuncionarioController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Você não tem permissão para acessar este conteúdo. "
				+ "Para acessá-lo se identifique <a href=\"./index.jsp\">aqui</a>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();
		
		
		try {

			FuncionarioDAO funcionarioDAO = new FuncionarioDAOImpl();
			
			if ("atualizar".equals(cmd)) {
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
			}
			else if ("adicionar".equals(cmd)) {
				Funcionario funcionario = new Funcionario();
				funcionario.setNome(request.getParameter("txtNome"));
				funcionario.setCpf(request.getParameter("txtCpf"));
				funcionario.setPassword(request.getParameter("txtSenha"));

				funcionarioDAO.adicionar(funcionario);
				
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);

				msg = "Funcionário adicionado com sucesso";

			}
		
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao acessar funcionário :(";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./funcionario.jsp");
	}
}
