package sicone.dao;

import java.util.List;

import sicone.model.Produto;

public interface ProdutoDAO {
	
	public void adicionar(Produto produto) throws GenericDAOException;
	public void salvar(int codigo, String nome, Produto produto) throws GenericDAOException;
	public List<Produto> pesquisarNomeProduto(String produto) throws GenericDAOException;

}
