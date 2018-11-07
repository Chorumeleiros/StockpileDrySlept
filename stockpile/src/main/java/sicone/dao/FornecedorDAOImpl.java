package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.connection.ConnectionFactory;
import sicone.model.Fornecedor;

/**
 * classe responsavel pelas operacoes do fornecedor com o banco de dados
 * 
 * @author Otavio Calado
 * 
 */

public class FornecedorDAOImpl implements FornecedorDAO {
	
	public FornecedorDAOImpl() throws GenericDAOException {
	
	}
	
	@Override
	public void adicionar (Fornecedor fornecedor) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
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
		Connection connection = ConnectionFactory.createConnection();
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
