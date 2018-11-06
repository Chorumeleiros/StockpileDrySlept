package sicone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.FornecedorDAO;
import sicone.dao.FornecedorDAOImpl;
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

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();

		try {

			FornecedorDAO fornecedorDao = new FornecedorDAOImpl();

			if ("adicionar".equals(cmd)) {
				Fornecedor fornecedor = new Fornecedor();

				fornecedor.setNome(request.getParameter("txtNome"));
				fornecedor.setCnpj(request.getParameter("txtCnpj"));
				fornecedorDao.adicionar(fornecedor);

				msg = "Fornecedor adicionado.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "Erro ao adicionar fornecedor.";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./fornecedor.jsp");
	}
}
