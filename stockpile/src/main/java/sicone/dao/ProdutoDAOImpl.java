package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.connection.ConnectionFactory;
import sicone.model.Produto;

public class ProdutoDAOImpl implements ProdutoDAO {

	public ProdutoDAOImpl() throws GenericDAOException {

	}

	@Override
	public void adicionar(Produto produto) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		String sql = "INSERT INTO produto (Nome, Qtd, Descr) VALUES (?, ?, ?)";

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
		Connection connection = ConnectionFactory.createConnection();
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
				produto.setDescr(rs.getString("Descr"));

				lista.add(produto);
			}
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
		return lista;
	}
	
	@Override
	public void salvar(int codigo, String nome, Produto produto) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
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
				pstmt.setInt(4, codigo);
				pstmt.executeUpdate();
				
			}
		
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}
}
