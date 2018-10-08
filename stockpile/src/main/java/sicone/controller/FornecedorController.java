package sicone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.FornecedorDAO;
import sicone.model.Fornecedor;

@WebServlet("/Fornecedor")
public class FornecedorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FornecedorController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Para acessar utilize a página <a href=\"./fornecedor.jsp\">Fornecedor</a>");
		// melhorar a resposta
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();

		try {

			FornecedorDAO fornecedorDao = new FornecedorDAO();

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
