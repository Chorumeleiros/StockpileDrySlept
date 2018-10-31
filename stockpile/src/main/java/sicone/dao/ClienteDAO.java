package sicone.dao;

import java.util.List;

import sicone.model.Cliente;

public interface ClienteDAO {
	public void adicionar(Cliente cliete) throws GenericDAOException;
	public List<Cliente> pesquisarNomeCliente(String cliente) throws GenericDAOException;	
}
