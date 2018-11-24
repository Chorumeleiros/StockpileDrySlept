package sicone.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
		String sql = "INSERT INTO FUNCIONARIO (NOME, CPF, SENHA) VALUES (?, ?, ?)";
		String ora = "CALL p_addFunario(?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(ora);
			pstmt.setInt(1, funcionario.getId());
			pstmt.setString(2, funcionario.getNome());
			pstmt.setString(3, funcionario.getCpf());
			pstmt.setString(4, funcionario.getPassword());
						
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		
	}

	@Override
	public void remover(int id) throws GenericDAOException {
		String ora = "DELETE FROM FUNCIONARIO WHERE ID_FUNC = ?";
		
		Connection connection = ConnectionFactory.createConnection();

		try {
			PreparedStatement pstmt = connection.prepareStatement(ora);
			pstmt.setInt(1, id);
			System.out.println("q");
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}
		
	@Override
	public void editar(Funcionario funcionario) throws GenericDAOException {
		String ora = "UPDATE FUNCIONARIO SET NOME = ?, CPF = ?, SENHA = ? "
				+ "WHERE ID_FUNC = ?";
		
		Connection connection = ConnectionFactory.createConnection();

		try {
			PreparedStatement pstmt = connection.prepareStatement(ora);
			pstmt.setString(1, funcionario.getNome());
			pstmt.setString(2, funcionario.getCpf());
			pstmt.setString(3, funcionario.getPassword());
						
			pstmt.setInt(4, funcionario.getId());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
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
				funcionario.setId(rs.getInt("ID_FUNC"));
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
	
	@Override
	public boolean comparaCPF(String cpf) throws GenericDAOException {
		Connection connection = ConnectionFactory.createConnection();
		boolean compararCPF = false;
		
		String sql = "SELECT * FROM FUNCIONARIO WHERE CPF LIKE ?";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, cpf);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setCpf(rs.getString("CPF"));
				
				if (rs.getString("CPF").equals(cpf)) {
					return compararCPF = true;
				}
			}

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		return compararCPF;
	}

}
