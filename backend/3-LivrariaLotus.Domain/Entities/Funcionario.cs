namespace backend.Models;

public class Funcionario
{
    public int FuncionarioId { get; set; }
    public string NomeCompleto { get; set; }
    public string Documento { get; set; }
    public DateTime DataContratacao { get; set; }
    public DateTime DataNascimento { get; set; }
    public string Cargo { get; set; }
    public bool Ativo { get; set; } = true;
    public Usuario Usuario { get; set; }
}


//TODO: Inserir restrição de documento único no banco de dados para o campo Documento.