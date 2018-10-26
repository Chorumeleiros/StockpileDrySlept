package sicone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.model.Produto;

public class ProdutoDAOImpl implements ProdutoDAO {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASS = "";
	
	private static final String OJDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String OJDBC_USER = "root";
	private static final String OJDBC_PASS = "";
	
	private Connection connection;

	public ProdutoDAOImpl() throws GenericDAOException {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new GenericDAOException(e);
		}
	}

	@Override
	public void adicionar(Produto produto) throws GenericDAOException {
		String sql = "INSERT INTO produto (Nome, Qtd, Descr)" + "VALUES (?, ?, ?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, produto.getNome());
			pstmt.setInt(2, produto.getQtd());
			pstmt.setString(3, produto.getDescr());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}

	}

	@Override
	public List<Produto> pesquisarNomeProduto(String nome) throws GenericDAOException {
		List<Produto> lista = new ArrayList<>();
		String sql = "SELECT * FROM produto WHERE Nome like ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();
				produto.setCodigo(rs.getInt("idProduto"));
				produto.setNome(rs.getString("Nome"));
				produto.setQtd(rs.getInt("Qtd"));
				produto.setDescrProd(rs.getString("Descr"));

				lista.add(produto);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return lista;
	}
	
	@Override
	public void salvar(int codigo, String nome, Produto produto) throws GenericDAOException {
		String sql = "UPDATE produto SET Nome = ?, Qtd = ?, Descr = ?"
				+ "WHERE idProduto = ?";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			pesquisarNomeProduto(nome);
			
			if (nome.equals(rs.getString("Nome"))) {
				pstmt.setInt(2, produto.getQtd());
				
				pstmt.executeUpdate();

			} else {
			
			pstmt.setString(1, produto.getNome());
			pstmt.setInt(2, produto.getQtd());
			pstmt.setString(3, produto.getDescr());
			pstmt.setInt(6, produto.getCodigo());
			
			pstmt.executeUpdate();
			
			}
		
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}
}
