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
	private String nomePessoa;
	private int idFuncionario;

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

	public int getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(int idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

}
