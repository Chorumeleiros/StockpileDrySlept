package sicone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.model.UserInfo;
import sicone.dao.AuthDAO;
import sicone.dao.ClienteDAO;
import sicone.dao.ClienteDAOImpl;
import sicone.dao.FornecedorDAO;
import sicone.dao.FornecedorDAOImpl;
import sicone.dao.GenericDAOException;
import sicone.dao.ProdutoDAO;
import sicone.dao.ProdutoDAOImpl;
import sicone.model.Cliente;
import sicone.model.Fornecedor;
import sicone.model.Funcionario;
import sicone.model.Produto;

/**
 * classe responsavel por receber os parametros de autenticacao da view
 * 
 * @author Dodo
 *
 */

@WebServlet("/Auth")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Funcionario funcionario = new Funcionario();

	public AuthController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user = request.getParameter("txtUser");
		String pass = request.getParameter("txtPass");
		String cmd = request.getParameter("cmd");
		String msg = null;

		HttpSession session = request.getSession();

		AuthDAO daoLogin = new AuthDAO();

		if ("Entrar".equals(cmd)) {

			try {
				if (user.equals("admin") && pass.equals("admin")) {

					UserInfo userInfo = new UserInfo();
					userInfo.setProfile("admin");
					userInfo.setNome("Admin");
					userInfo.setLogado(true);
					session.setAttribute("ADMIN_LOGADO", userInfo);
					
					
					
					response.sendRedirect("./funcionario.jsp");

				} else if (daoLogin.checkLogin(Integer.parseInt(user), pass)) {

					UserInfo userInfo = new UserInfo();
					userInfo.setProfile("funcionario");
					userInfo.setNome(funcionario.getNome());
					userInfo.setLogado(true);
					session.setAttribute("FUNCIONARIO_LOGADO", userInfo);
					response.sendRedirect("./estoque.jsp");
					

					ProdutoDAO produtoDAO = new ProdutoDAOImpl();
					FornecedorDAO fornecedorDAO = new FornecedorDAOImpl();
					ClienteDAO clienteDAO = new ClienteDAOImpl();
					
					List<Fornecedor> listaFornecedor = fornecedorDAO.pesquisaFornecedor("");
					session.setAttribute("LISTA_FORNECEDOR", listaFornecedor);
					List<Produto> listaProduto = produtoDAO.pesquisarNomeProduto("");
					session.setAttribute("LISTA_PROD", listaProduto);
					List<Cliente>listaCliente = clienteDAO.pesquisarNomeCliente("");
					session.setAttribute ("LISTA_CLIENTE", listaCliente);
					

				} else {
					msg = "Usuário ou senha incorretos";

					session.setAttribute("MENSAGEM", msg);
					session.setAttribute("LOGADO", null);

					response.sendRedirect("./index.jsp");

				}

			} catch (GenericDAOException e) {
				e.printStackTrace();
			}
		}
		response.setContentType("text/html");
	}

}