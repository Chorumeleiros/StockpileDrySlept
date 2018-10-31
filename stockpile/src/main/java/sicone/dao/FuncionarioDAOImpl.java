package sicone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sicone.model.Funcionario;

public class FuncionarioDAOImpl implements FuncionarioDAO {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASS = "";
	private Connection connection;

	public FuncionarioDAOImpl() throws GenericDAOException {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

		} catch (SQLException | ClassNotFoundException e) {
			throw new GenericDAOException(e);
		}
	}

	@Override
	public void adicionar(Funcionario funcionario) throws GenericDAOException {
		String sql = "INSERT INTO funcionario (cpf, nome, password) VALUES (?,?,?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, funcionario.getCpf());
			pstmt.setString(2, funcionario.getNome());
			pstmt.setString(3, funcionario.getPassword());

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
	}

	@Override
	public void remover(int id) throws GenericDAOException {
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
		String sql = "SELECT * FROM funcionario WHERE nome LIKE ?";
		List<Funcionario> listaFuncionario = new ArrayList<>();
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, "%" + nome + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setId(rs.getInt("id"));
				funcionario.setCpf(rs.getString("cpf"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setPassword(rs.getString("password"));
				listaFuncionario.add(funcionario);
			}

		} catch (SQLException e) {
			throw new GenericDAOException(e);
		}
		return listaFuncionario;
	}

	@Override
	public void salvar(int id, Funcionario funcionario) throws GenericDAOException {
		String sql = "UPDATE funcionario " + "SET id = ?, cpf = ?, nome = ?, password = ? WHERE id = ?";

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
