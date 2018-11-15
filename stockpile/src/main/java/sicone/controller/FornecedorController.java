package sicone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.FornecedorDAO;
import sicone.dao.FornecedorDAOImpl;
import sicone.dao.GenericDAOException;
import sicone.model.Fornecedor;

/**
 * classe responsavel por receber os parametros do fornecedor da view
 * 
 * @author Dodo
 *
 */

@WebServlet("/FornecedorC")
public class FornecedorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FornecedorController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Você não tem permissão para acessar este conteúdo. "
				+ "Para acessá-lo se identifique <a href=\"./index.jsp\">aqui</a>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("fui");
		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();

		try {
			
			FornecedorDAO fornecedorDAO = new FornecedorDAOImpl();

			if ("adicionar".equals(cmd)) {
				Fornecedor fornecedor = new Fornecedor();

				fornecedor.setCnpj(request.getParameter("txtCnpj"));
				fornecedor.setNome(request.getParameter("txtNome"));
				fornecedorDAO.adicionar(fornecedor);

				List<Fornecedor> listaFornecedor = fornecedorDAO.pesquisaFornecedor("");
				session.setAttribute("LISTA_FORNECEDOR", listaFornecedor);

				msg = "Fornecedor adicionado com sucesso";
			}
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao adicionar fornecedor :(";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./fornecedor.jsp");
	}
}
