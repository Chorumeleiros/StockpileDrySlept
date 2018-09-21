package sicone.model;

import java.io.Serializable;

/**
 * classe responsavel por manter as informacoes do fornecedor.
 * 
 * @author Dodo
 *
 */
public class Fornecedor implements Serializable {
	private static final long serialVersionUID = -4121986222773473431L;

	private int cnpj;
	private String nomeForn;

	public int getCnpj() {
		return cnpj;
	}

	public void setCnpj(int cnpj) {
		this.cnpj = cnpj;
	}

	public String getNomeForn() {
		return nomeForn;
	}

	public void setNomeForn(String nomeForn) {
		this.nomeForn = nomeForn;
	}

}
