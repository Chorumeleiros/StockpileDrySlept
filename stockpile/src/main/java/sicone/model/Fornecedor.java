package sicone.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * classe responsavel por manter as informacoes do fornecedor.
 * 
 * @author Dodo
 *
 */
@Entity
public class Fornecedor implements Serializable {
	private static final long serialVersionUID = -4121986222773473431L;

	@Id
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
