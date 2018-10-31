package sicone.dao;

import java.util.List;

import sicone.model.Funcionario;

public interface FuncionarioDAO {

	public void adicionar(Funcionario funcionario) throws GenericDAOException;
	List<Funcionario> pesquisarPorNome(String nome) throws GenericDAOException;
	public void remover(int id) throws GenericDAOException;
	public void salvar(int id, Funcionario funcionario) throws GenericDAOException;
}
