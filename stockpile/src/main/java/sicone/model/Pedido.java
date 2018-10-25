package sicone.model;

import java.io.Serializable;
import java.util.Date;

/**
 * classe responsavel por manter as informacoes do pedido.
 * 
 * @author Dodo
 *
 */

public class Pedido implements Serializable {
	private static final long serialVersionUID = 6320049199416842349L;

	private int numPedido;
	private Date dataPedido;

	public int getNumPedido() {
		return numPedido;
	}

	public void setNumPedido(int numPedido) {
		this.numPedido = numPedido;
	}

	public Date getDataPedido() {
		return dataPedido;
	}

	public void setDataPedido(Date dataPedido) {
		this.dataPedido = dataPedido;
	}

}
