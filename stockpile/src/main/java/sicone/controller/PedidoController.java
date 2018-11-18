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
import sicone.dao.PedidoDAO;
import sicone.dao.PedidoDAOImpl;
import sicone.model.Cliente;
import sicone.model.Pedido;
import sicone.model.Produto;

/**
 * classe responsavel por receber os parametros de pedido da view 
 * 
 * @author Dodo
 *
 */

@WebServlet("/PedidoC")
public class PedidoController extends HttpServlet  {
	private static final long serialVersionUID = 7764648766493441423L;

	public PedidoController() {
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

			PedidoDAO pedidoDAO = new PedidoDAOImpl();
			
			 if ("novo-pedido".equals(cmd)) {
				 Cliente cliente = new Cliente();
				 Pedido pedido = new Pedido();
				 Produto produto = new Produto();
				
				pedido.setNumPedido(Integer.parseInt(request.getParameter("numPedido")));
				pedido.setDataPedido(request.getParameter("dataPedido"));
				cliente.setNome(request.getParameter("nomeCliente"));

				if ("adicionar".equals(cmd)) {
					
					produto.setNome(request.getParameter("item"));
					produto.setQtd(Integer.parseInt(request.getParameter("qtd")));
					
					msg = "Produto adicionado com sucesso";
					
				} else if ("remover".equals(cmd)) {
					msg = "Produto removido com sucesso";
					
				} else if ("limpar-pedido".equals(cmd)) {
					
					msg = "Pedido não realizado";
					
				} else if ("finalizar-pedido".equals(cmd)) {
					pedidoDAO.adicionar(cliente, pedido, produto);
					
					msg = "Pedido finalizado com sucesso";
					
				}
				
//				List<Pedido> listaPedido = pedidoDAO.pesquisarNumPedido("");
//				session.setAttribute("LISTA_PEDIDO", listaPedido);

			} else if ("pesquisar".equals(cmd)) {
//				List<Pedido> buscaProduto = pedidoDAO.pesquisarNumPedido(request.getParameter("txtNome"));
//				session.setAttribute("LISTA_PEDIDO", buscaProduto);
			}

		} catch (GenericDAOException e) {
			e.printStackTrace();
			msg = "Erro ao executar operação :(";

		}
		
		session.setAttribute("MENSAGEM", msg);
		response.sendRedirect("./novo-pedido.jsp");

	}
}
