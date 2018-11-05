package sicone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.ClienteDAO;
import sicone.dao.ClienteDAOImpl;
import sicone.dao.GenericDAOException;
import sicone.model.Cliente;


 @WebServlet ("/ClienteC")
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ClienteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append("Você não tem permissão para acessar este conteúdo. "
				+ "Para acessá-lo se identifique <a href=\"./index.jsp\">aqui</a>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		String msg = null;
		HttpSession session = request.getSession();
	
		try {

			ClienteDAO clienteDAO = new ClienteDAOImpl();

			if ("adicionar".equals(cmd)) {
				Cliente cliente = new Cliente();

				cliente.setCpf(request.getParameter("txtCpf"));
				cliente.setNome(request.getParameter("txtNome"));
				clienteDAO.adicionar(cliente);

				msg = "Cliente adicionado.";
			}
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao adicionar cliente";
		}

		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./cliente.jsp");
	}

}
