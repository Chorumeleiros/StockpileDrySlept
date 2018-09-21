package sicone.model;

import java.io.Serializable;

/**
 * classe responsavel por manter as informacoes do admin.
 * 
 * @author Dodo
 *
 */
public class Admin implements Serializable {
	private static final long serialVersionUID = -1210253221574220516L;

	private int id;
	private String nome;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
