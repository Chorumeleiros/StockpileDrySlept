package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.connection.ConnectionFactory;
import sicone.model.Cliente;

/**
 * classe responsavel pelas operacoes do cliente com o banco de dados
 * 
 * @author Dodo
 *
 */

public class ClienteDAOImpl implements ClienteDAO {
	
	public ClienteDAOImpl() throws GenericDAOException {
	
	}
	
	@Override
	public void adicionar (Cliente cliente) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		String sql = "INSERT INTO produto (CPF, NOME)" + "VALUES (?, ?)";
		//String lista = null;
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString (1, cliente.getCpf());
			pstmt.setString (2, cliente.getNome());
			pstmt.executeUpdate ();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		//pesquisarNomeCliente(lista);
		
	}
	
	@Override
	public List<Cliente> pesquisarNomeCliente(String nome) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		List<Cliente> lista = new ArrayList<>();
		String sql = "SELECT * FROM CLIENTE WHERE NOME LIKE ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setCpf(rs.getString("CPF"));
				cliente.setNome(rs.getString("NOME"));
				
				lista.add(cliente);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return lista;
	}
	

}
