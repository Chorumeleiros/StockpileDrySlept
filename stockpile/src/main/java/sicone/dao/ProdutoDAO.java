package sicone.dao;

import java.util.List;

import sicone.model.Fornecedor;
import sicone.model.Produto;

public interface ProdutoDAO {
	
	public void adicionar(Produto produto, Fornecedor fornecedor) throws GenericDAOException;
	public void salvar(int codigo, String nome, Produto produto) throws GenericDAOException;
	public List<Produto> pesquisarNomeProduto(String produto) throws GenericDAOException;
	public List<Produto> pesquisarCodigo(int codigo) throws GenericDAOException;

}
