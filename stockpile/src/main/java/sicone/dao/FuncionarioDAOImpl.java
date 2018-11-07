package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.connection.ConnectionFactory;
import sicone.model.Funcionario;

/**
 * classe responsavel pelas operacoes do funcionario com o banco de dados
 * 
 * @author Dodo
 *
 */

public class FuncionarioDAOImpl implements FuncionarioDAO {
	Connection connection = ConnectionFactory.createConnection();
	public FuncionarioDAOImpl() throws GenericDAOException {
		
	}

	@Override
	public void adicionar(Funcionario funcionario) throws GenericDAOException {
			
		String sql = "INSERT INTO funcionario (NOME, CPF, SENHA) VALUES (?, ?, ?) ;"; //no banco este campo password � chamado de senha

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
		//	pstmt.setLong(1, 0);
			pstmt.setString(1, funcionario.getNome());
			pstmt.setString(2, funcionario.getCpf());
			pstmt.setString(3, funcionario.getPassword());
			pstmt.executeUpdate();
			System.out.println(funcionario.getNome());

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}

	@Override
	public void remover(int id) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		String sql = "DELETE FROM funcionario WHERE id = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}

	}

	@Override
	public List<Funcionario> pesquisarPorNome(String nome) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		List<Funcionario> listaFuncionario = new ArrayList<>();
		String sql = "SELECT * FROM funcionario WHERE nome LIKE ?";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setId(rs.getInt("id"));
				funcionario.setCpf(rs.getString("cpf"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setPassword(rs.getString("senha"));
				listaFuncionario.add(funcionario);
			}

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		return listaFuncionario;
	}

	@Override
	public void salvar(int id, Funcionario funcionario) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		String sql = "UPDATE funcionario " + "SET id = ?, cpf = ?, nome = ?, senha = ? WHERE id = ?";

		try {
			PreparedStatement pstm = connection.prepareStatement(sql);
			pstm.setInt(1, funcionario.getId());
			pstm.setString(2, funcionario.getCpf());
			pstm.setString(3, funcionario.getNome());
			pstm.setString(4, funcionario.getPassword());
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}

}
