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

	private String cnpj;
	private String nome;

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String string) {
		this.cnpj = string;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
