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
		String sql = "INSERT INTO FUNCIONARIO (NOME, CPF, SENHA) VALUES (?, ?, ?)"; // no banco este campo password é
//		String listaFuncionario = null;																			// chamado de senh

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, funcionario.getNome());
			pstmt.setString(2, funcionario.getCpf());
			pstmt.setString(3, funcionario.getPassword());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
//		pesquisarPorNome(listaFuncionario);
	}

	@Override
	public List<Funcionario> pesquisarPorNome(String nome) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		List<Funcionario> listaFuncionario = new ArrayList<>();
		String sql = "SELECT * FROM FUNCIONARIO WHERE NOME LIKE ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setId(rs.getInt("ID"));
				funcionario.setCpf(rs.getString("CPF"));
				funcionario.setNome(rs.getString("NOME"));
				funcionario.setPassword(rs.getString("SENHA"));
				listaFuncionario.add(funcionario);
			}

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		return listaFuncionario;
	}

}
