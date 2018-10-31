package sicone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.model.Cliente;
import sicone.model.Produto;

public class ClienteDAOImpl implements ClienteDAO {
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASS = "";
	
	private static final String OJDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String OJDBC_USER = "root";
	private static final String OJDBC_PASS = "";
	
	private Connection connection;
	
	public ClienteDAOImpl() throws GenericDAOException {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new GenericDAOException (e);
		}
	}
	@Override
	public void adicionar (Cliente cliente) throws GenericDAOException {
		String sql = "INSERT INTO produto (Cpf, Nome)" + "VALUES (?,?)";
		String lista = null;
		
		pesquisarNomeCliente(lista);
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString (1, cliente.getCpf());
			pstmt.setString (2, cliente.getNome());
			pstmt.executeUpdate ();
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		pesquisarNomeCliente(lista);
		
	}
	
	@Override
	public List<Cliente> pesquisarNomeCliente(String nome) throws GenericDAOException {
		List<Cliente> lista = new ArrayList<>();
		String sql = "SELECT * FROM produto";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setCpf(rs.getString("cpf"));
				cliente.setNome(rs.getString("nome"));
				
				lista.add(cliente);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return lista;
	}
	

}
