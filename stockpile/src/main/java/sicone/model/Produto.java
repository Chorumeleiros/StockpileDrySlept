package sicone.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * classe responsavel pelas informacoes do produto.
 * 
 * @author Dodo
 *
 */
@Entity
public class Produto implements Serializable {
	private static final long serialVersionUID = -5532756923012952866L;

	@Id
	private int codProd;
	private String nomeProd;
	private int qtdProd;
	private String descrProd;

	public int getCodProd() {
		return codProd;
	}

	public void setCodProd(int codProd) {
		this.codProd = codProd;
	}

	public String getNomeProd() {
		return nomeProd;
	}

	public void setNomeProd(String nomeProd) {
		this.nomeProd = nomeProd;
	}

	public int getQtdProd() {
		return qtdProd;
	}

	public void setQtdProd(int qtdProd) {
		this.qtdProd = qtdProd;
	}

	public String getDescrProd() {
		return descrProd;
	}

	public void setDescrProd(String descrProd) {
		this.descrProd = descrProd;
	}

}
