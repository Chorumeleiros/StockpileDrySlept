package sicone.dao;

import java.util.List;


import sicone.model.Fornecedor;

/*
@author Otavio Calado
*/

public interface FornecedorDAO {

	public void adicionar(Fornecedor fornecedor) throws GenericDAOException;
	public List<Fornecedor> pesquisaFornecedor(String fornecedor) throws GenericDAOException;

}