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
		response.getWriter().append("Voc� n�o tem permiss�o para acessar este conte�do. "
				+ "Para acess�-lo se identifique <a href=\"./index.jsp\">aqui</a>");
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();
		
		Funcionario funcionario = new Funcionario();
		
		
		try {

			FuncionarioDAO funcionarioDAO = new FuncionarioDAOImpl();
			
			if ("atualizar".equals(cmd)) {
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
			
			}
			
			if ("pesquisar".equals(cmd)) {
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome(request.getParameter("txtNome"));
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
			}
			
			if ("remover".equals(cmd)) {
				int id = Integer.parseInt(request.getParameter("txtId"));
				
				funcionarioDAO.remover(id);
				
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
				
				msg = "Funcion�rio removido com sucesso";
			}
			
			if ("editar".equals(cmd)) {
				
				funcionario.setId(Integer.parseInt(request.getParameter("txtId")));
				funcionario.setNome(request.getParameter("txtNome"));
				funcionario.setCpf(request.getParameter("txtCpf"));
				funcionario.setPassword(request.getParameter("txtSenha"));

				funcionarioDAO.editar(funcionario);
				
				
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
				
				msg = "Funcion�rio editado com sucesso";
			}
			
			if ("adicionar".equals(cmd)) {
				
				if (funcionarioDAO.comparaCPF(request.getParameter("txtCpf")) == true) {
					List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
					session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);
					msg = "CPF j� cadastrado";
					
				} else {
					
				funcionario.setId(Integer.parseInt(request.getParameter("txtId")));
				funcionario.setNome(request.getParameter("txtNome"));
				funcionario.setCpf(request.getParameter("txtCpf"));
				funcionario.setPassword(request.getParameter("txtSenha"));

				funcionarioDAO.adicionar(funcionario);
				
				List<Funcionario> listaFuncionario = funcionarioDAO.pesquisarPorNome("");
				session.setAttribute("LISTA_FUNCIONARIO", listaFuncionario);

				msg = "Funcion�rio adicionado com sucesso";
				
				}
			}
		
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao acessar funcion�rio :(";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./funcionario.jsp");
	}
}
