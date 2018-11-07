package sicone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sicone.connection.ConnectionFactory;

/**
 * classe responsavel por autenticar os dados de login com o banco de dados
 * 
 * @author Dodo
 *
 */

public class AuthDAO {
	public boolean checkLogin(int id, String senha) throws GenericDAOException {
		
		Connection con = ConnectionFactory.createConnection();
		String sql = "SELECT * FROM FUNCIONARIO WHERE ID = ? AND SENHA = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			// comando para selecionar login e senha do usuario
			stmt = con.prepareStatement(sql);

			stmt.setInt(1, id);
			stmt.setString(2, senha);
			rs = stmt.executeQuery(); // result set recebe o statemnt com o comando que libera a consulta

			if (rs.next()) { // condicao para verificar se existe o login e senha do input

				check = true; // se existe retorna checkLogin com true
			}

		}catch (SQLException e) {
			throw new GenericDAOException(e);
		} finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return check; // retorna a lista "usuarios"
	}

}
