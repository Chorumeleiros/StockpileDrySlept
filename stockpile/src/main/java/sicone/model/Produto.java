package sicone.model;

import java.io.Serializable;

/**
 * classe responsavel pelas informacoes do produto.
 * 
 * @author Dodo
 *
 */

public class Produto implements Serializable {
	private static final long serialVersionUID = -5532756923012952866L;

	private int codigo;
	private String nome = "";
	private int qtd;
	private String descr = "";

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

	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	@Override
	public String toString() { 
		StringBuffer info = new StringBuffer();
		info.append(this.getCodigo());
		info.append(this.getNome());
		info.append(this.getQtd());
		info.append(this.getDescr());
		return info.toString();
	}

}
