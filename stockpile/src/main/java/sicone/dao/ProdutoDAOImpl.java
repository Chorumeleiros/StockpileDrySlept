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
	
	private static final String OJDBC_URL = "jdbc:oracle:thin:@localhost:1521:siconeORA";
	private static final String OJDBC_USER = "sys";
	private static final String OJDBC_PASS = "alunofatec";
	
	private Connection connection;

	public ProdutoDAOImpl() throws GenericDAOException {
		try {

			Class.forName("com.mysql.jdbc.Driver"); 
			connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
			
			Class.forName("oracle.jdbc.driver.OracleDrive");
			connection = DriverManager.getConnection(OJDBC_URL, OJDBC_USER, OJDBC_PASS);
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new GenericDAOException(e);
		}
	}

	@Override
	public void adicionar(Produto produto) throws GenericDAOException {
		String sql = "INSERT INTO produto (Nome, Qtd, Descr) VALUES (?, ?, ?)";
		String ora = "INSERT INTO PRODUTO (CODPROD, NOMEPROD, QTDPROD, DESCPROD) "
				+ "VALUES (siconeORA.NEXTVAL, ?, ?, ?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, produto.getNome());
			pstmt.setInt(2, produto.getQtd());
			pstmt.setString(3, produto.getDescr());
			pstmt.executeUpdate();
			
			PreparedStatement pstmtORA = connection.prepareStatement(ora);
			pstmtORA.setString(1, produto.getNome());
			pstmtORA.setInt(2, produto.getQtd());
			pstmtORA.setString(3, produto.getDescr());
			pstmtORA.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}

	}

	@Override
	public List<Produto> pesquisarNomeProduto(String nome) throws GenericDAOException {
		List<Produto> lista = new ArrayList<>();
		String sql = "SELECT * FROM produto WHERE Nome like ?";
		String ora = "SELECT * FROM PRODUTO WHERE NOMEPROD LIKE ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();
			
			PreparedStatement pstmtORA = connection.prepareStatement(ora);
			pstmtORA.setString(1, "%" + nome + "%");
			ResultSet rsORA = pstmtORA.executeQuery();

			while (rs.next() || rsORA.next()) {
				Produto produto = new Produto();
				
				produto.setCodigo(rs.getInt("idProduto"));
				produto.setNome(rs.getString("Nome"));
				produto.setQtd(rs.getInt("Qtd"));
				produto.setDescrProd(rs.getString("Descr"));
				
				produto.setCodigo(rsORA.getInt("CODPROD"));
				produto.setNome(rsORA.getString("NOMEPROD"));
				produto.setQtd(rsORA.getInt("QTDPROD"));
				produto.setDescrProd(rsORA.getString("DESCPROD"));

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
		String ora = "UPDATE PRODUTO SET NOMEPROD = ?, QTDPROD = ?, DESCPROD = ?"
				+ "WHERE CODPROD = ?";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			PreparedStatement pstmtORA = connection.prepareStatement(ora);
			ResultSet rsORA = pstmtORA.executeQuery();
			
			pesquisarNomeProduto(nome);
			
			if (nome.equals(rs.getString("Nome")) || nome.equals(rsORA.getString("NOMEPROD"))) {
				
				pstmt.setInt(2, produto.getQtd());
				pstmt.executeUpdate();
				
				pstmtORA.setInt(2, produto.getQtd());
				pstmtORA.executeUpdate();
			
			} else {
				
				pstmt.setString(1, produto.getNome());
				pstmt.setInt(2, produto.getQtd());
				pstmt.setString(3, produto.getDescr());
				pstmt.setInt(4, codigo);
				pstmt.executeUpdate();
				
				pstmtORA.setString(1, produto.getNome());
				pstmtORA.setInt(2, produto.getQtd());
				pstmtORA.setString(3, produto.getDescr());
				pstmtORA.setInt(4, codigo);
				pstmtORA.executeUpdate();
				
			}
		
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}
}
