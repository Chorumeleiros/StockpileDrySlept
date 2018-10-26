package sicone.dao;

import java.util.List;

import sicone.model.Funcionario;

public interface FuncionarioDAO {

	void adicionar(Funcionario funcionario) throws GenericDAOException;
	List<Funcionario> pesquisaPorNome(String nome) throws GenericDAOException;
	void remover(int id) throws GenericDAOException;
	void salvar(int id, Funcionario funcionario) throws GenericDAOException;
}
