package sicone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.model.Fornecedor;

/*
@author Otavio Calado
*/

public class FornecedorDAOImpl implements FornecedorDAO {
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASS = "";
	
	private Connection connection;
	
	public FornecedorDAOImpl() throws GenericDAOException {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new GenericDAOException (e);
		}
	}
	@Override
	public void adicionar (Fornecedor fornecedor) throws GenericDAOException {
		String sql = "INSERT INTO fornecedor (Cnpj, Nome)" + "VALUES (?,?)";
		String lista = null;
		
		
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString (1, fornecedor.getCnpj());
			pstmt.setString (2, fornecedor.getNome());
			pstmt.executeUpdate ();
			pesquisaFornecedor(lista);
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	
		
	}
	
	@Override
	public List<Fornecedor> pesquisaFornecedor(String nome) throws GenericDAOException {
		List<Fornecedor> lista = new ArrayList<>();
		String sql = "SELECT * FROM fornecedor";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Fornecedor fornecedor = new Fornecedor();
				fornecedor.setCnpj(rs.getString("cnpj"));
				fornecedor.setNome(rs.getString("nome"));
				
				lista.add(fornecedor);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return lista;
	}
	

}
