package sicone.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * classe responsavel por manter as informacoes do admin.
 * 
 * @author Dodo
 *
 */
@Entity
public class Admin implements Serializable {
	private static final long serialVersionUID = -1210253221574220516L;

	@Id
	@GeneratedValue
	private int id;
	private String nome;
	private String password;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
