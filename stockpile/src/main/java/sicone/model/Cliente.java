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

	private int cpf;
	private String nomePessoa;

	public int getCpf() {
		return cpf;
	}

	public void setCpf(int cpf) {
		this.cpf = cpf;
	}

	public String getNomePessoa() {
		return nomePessoa;
	}

	public void setNomePessoa(String nomePessoa) {
		this.nomePessoa = nomePessoa;
	}

}
