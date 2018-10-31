package sicone.model;

import java.io.Serializable;

/**
 * classe responsavel por manter as informacoes do cliente.
 * 
 * @author Dodo
 *
 */
public class Cliente extends Pessoa implements Serializable {
	private static final long serialVersionUID = -2625897989574593814L;

	private String cpf;
	private String nome;

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
