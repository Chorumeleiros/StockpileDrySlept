package sicone.model;

import java.io.Serializable;

/**
 * classe responsavel por manter as informacoes do funcionario.
 * 
 * @author Dodo
 *
 */
public class Funcionario extends Pessoa implements Serializable {
	private static final long serialVersionUID = 7680930582309971499L;

	private int cpf;
	private String nome;
	private int id;
	private String password;

	public int getCpf() {
		return cpf;
	}

	public void setCpf(int cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
