package sicone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sicone.dao.GenericDAOException;
import sicone.dao.ProdutoDAO;
import sicone.dao.ProdutoDAOImpl;
import sicone.model.Fornecedor;
import sicone.model.Produto;


/**
 * classe responsavel por receber os parametros do produto da view
 * 
 * @author Dodo
 *
 */

@WebServlet("/ProdutoC")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = -4057237645388450674L;

	public ProdutoController() {
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
			
			ProdutoDAO produtoDAO = new ProdutoDAOImpl();
			if ("atualizar".equals(cmd)) {
				List<Produto> listaProduto = produtoDAO.pesquisarNomeProduto("");
				session.setAttribute("LISTA_PROD", listaProduto);
				
				
			}
			 if ("adicionar".equals(cmd)) {
				Produto produto = new Produto();
				Fornecedor fornecedor = new Fornecedor();
			
				produto.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
				produto.setQtd(Integer.parseInt(request.getParameter("txtQtd")));
				produto.setNome(request.getParameter("txtNome"));
				produto.setDescr(request.getParameter("txtDescr"));
				fornecedor.setCnpj(request.getParameter("txtFornecedor"));

				produtoDAO.adicionar(produto, fornecedor);

				List<Produto> listaProduto = produtoDAO.pesquisarNomeProduto("");
				session.setAttribute("LISTA_PROD", listaProduto);

				msg = "Produto adicionado com sucesso";

			}  if ("pesquisar".equals(cmd)) {
				List<Produto> buscaProduto = produtoDAO.pesquisarNomeProduto(request.getParameter("txtNome"));
				session.setAttribute("LISTA_PROD", buscaProduto);
			
			}

		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao executar operação :(";

		}
		
		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./estoque.jsp");

	}
}
