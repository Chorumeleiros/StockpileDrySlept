package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.connection.ConnectionFactory;
import sicone.model.Cliente;
import sicone.model.Pedido;
import sicone.model.Produto;

/**
 * classe responsavel pelas operacoes do pedido com o banco de dados
 * 
 * @author Dodo
 *
 */

public class PedidoDAOImpl implements PedidoDAO {
	
	public PedidoDAOImpl() throws GenericDAOException {

	}

	@Override
	public void adicionar(Cliente cliente, Pedido pedido, Produto produto) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		String sql = "INSERT INTO PEDIDO (NOME, DATAPEDIDO, NOMEPROD, QTDPROD) VALUES (?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, cliente.getNome());
			pstmt.setString(2, pedido.getDataPedido());
			pstmt.setString(3, produto.getNome());
			pstmt.setInt(4, produto.getQtd());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}

	}
	
	@Override
	public List<Pedido> pesquisarNumPedido(int numPedido) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		List<Pedido> listaPedido = new ArrayList<>();
		String sql = "SELECT * FROM PEDIDO WHERE NUMPEDIDO LIKE ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, numPedido);
			ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				Pedido pedido = new Pedido();
				Produto produto = new Produto();
				Cliente cliente = new Cliente();
				
				pedido.setDataPedido(rs.getString("DATAPEDIDO"));
				cliente.setNome(rs.getString("NOME"));
				produto.setCodigo(rs.getInt("CODPROD"));
				produto.setNome(rs.getString("NOMEPROD"));
				produto.setQtd(rs.getInt("QTDPROD"));


				listaPedido.add(pedido);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return listaPedido;
		
	}

}
