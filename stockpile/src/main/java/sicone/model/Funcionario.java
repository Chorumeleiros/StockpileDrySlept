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

	private int id;
	private String cpf;
	private String nome;
	private String password;

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

	@Override
	public String toString() { 
		StringBuffer info = new StringBuffer();
		info.append(this.getId());
		info.append(this.getCpf());
		info.append(this.getNome());
		info.append(this.getPassword());
		return info.toString();
	}
}
