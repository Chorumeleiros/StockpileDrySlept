package sicone.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * classe responsavel por criar e fechar a conexao com o banco de dados.
 * @author Dodo
 *
 */
public class ConnectionFactory {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/sicone";
	private static final String USER = "root";
	private static final String PASSWORD = "";
	
	private static final String O_DRIVER = "";
	private static final String O_URL = "jdbc:oracle:thin:@localhost:1521:siconeORA";
	private static final String O_USER = "sys";
	private static final String O_PASS = "alunofatec";

	/**
	 * metodo responsavel por criar conexao com o banco de dados.
	 * 
	 * @return connection
	 */
	public static Connection createConnection() {
		Connection connection = null;

		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USER, PASSWORD);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Erro ao criar conexão com o banco de dados: " + URL);
			throw new RuntimeException(e);
		}

		return connection;
	}

	/**
	 * metodo responsavel por fechar a conexao com o banco de dados.
	 * 
	 * @param connection
	 * @param pstmt
	 * @param rs
	 */
	public static void closeConnection(Connection connection, PreparedStatement pstmt, ResultSet rs) {

		try {
			if (connection != null) {
				connection.close();
			}

			if (pstmt != null) {
				pstmt.close();
			}

			if (rs != null) {
				rs.close();
			}

		} catch (SQLException e) {
			System.out.println("Erro ao fechar conexão com o banco de dados: " + URL);
			throw new RuntimeException(e);
		}
	}
}
