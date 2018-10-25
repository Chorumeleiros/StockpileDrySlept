package sicone.model;

import java.io.Serializable;
import java.util.List;

/**
 * classe responsavel pelas informacoes do produto.
 * 
 * @author Dodo
 *
 */

public class Produto implements Serializable {
	private static final long serialVersionUID = -5532756923012952866L;

	private int codigo;
	private String nome;
	private int qtd;
	private String descr;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescrProd(String descr) {
		this.descr = descr;
	}

}
