package sicone.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.model.UserInfo;
import sicone.dao.AuthDAO;
import sicone.dao.GenericDAOException;
import sicone.model.Admin;
import sicone.model.Funcionario;

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
	Admin admin = new Admin();

	public AuthController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user = request.getParameter("TXTUSER");
		String pass = request.getParameter("TXTPASS");
		String msg = null;

		HttpSession session = request.getSession();


		AuthDAO daoLogin = new AuthDAO();


		try {
			if (daoLogin.checkLogin(user, pass)) {

				UserInfo userInfo = new UserInfo();
				userInfo.setProfile("funcionario");
				userInfo.setNome(funcionario.getNome());
				userInfo.setLogado(true);
				session.setAttribute("FUNCIONARIO_LOGADO", userInfo);
				response.sendRedirect("./estoque.jsp");

			}  else if (String.valueOf(admin.getId()).equals("admin") && admin.getPassword().equals("admin")) {
				UserInfo userInfo = new UserInfo();
				userInfo.setProfile("admin");
				userInfo.setNome(admin.getNome());
				userInfo.setLogado(true);
				session.setAttribute("ADMIN_LOGADO", userInfo);

				response.sendRedirect("./funcionario.jsp");

			} else {
				msg = "Usuário ou senha incorretos.";

				session.setAttribute("MENSAGEM", msg);
				session.setAttribute("LOGADO", null);

				response.sendRedirect("./index.jsp");

			}
		} catch (GenericDAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//		} catch (IOException e) {
		//			e.printStackTrace();
		//		}

		response.setContentType("text/html");
	}


}