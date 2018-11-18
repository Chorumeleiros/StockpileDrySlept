package sicone.dao;

import java.util.List;

import sicone.model.Cliente;
import sicone.model.Pedido;
import sicone.model.Produto;

public interface PedidoDAO {
	
	public void adicionar(Cliente cliente, Pedido pedido, Produto produto) throws GenericDAOException;
	public List<Pedido> pesquisarNumPedido(int numPedido) throws GenericDAOException;

}
