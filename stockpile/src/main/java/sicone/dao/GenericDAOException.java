package sicone.dao;

/**
 * classe responsavel exceptions genericas do banco de dados.
 * 
 * @author Dodo
 *
 */
public class GenericDAOException extends Exception {
	private static final long serialVersionUID = -5129911695562524084L;

	public GenericDAOException() {
		super();
	}

	public GenericDAOException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public GenericDAOException(String message, Throwable cause) {
		super(message, cause);
	}

	public GenericDAOException(String message) {
		super(message);
	}

	public GenericDAOException(Throwable cause) {
		super(cause);
	}

}
