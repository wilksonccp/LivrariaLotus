namespace LivrariaLotus.Domain.Entities;

public class Funcionario
{
    public int FuncionarioId { get; set; }
    public required string NomeCompleto { get; set; }
    public required string Documento { get; set; }
    public DateTime DataContratacao { get; set; }
    public DateTime DataNascimento { get; set; }
    public required string Cargo { get; set; }
    public bool Ativo { get; set; } = true;
    public required Usuario Usuario { get; set; }
}


//TODO: Inserir restrição de documento único no banco de dados para o campo Documento.