using System.Reflection;
using System.Reflection.Metadata;

namespace LivrariaLotus.Domain.Entities;

public class Cliente
{
    public int ClienteId { get; set; }
    public required string NomeCompleto { get; set; }
    public required string Documento { get; set; }
    public DateTime DataNascimento { get; set; }
    public DateTime DataCadastro { get; set; }
    public Boolean Ativo { get; set; } = true;
    public required Usuario Usuario { get; set; }

    public ICollection<Contato> Contatos { get; set; } = new List<Contato>();
    public ICollection<Endereco> Enderecos { get; set; } = new List<Endereco>();
}
//TODO: Inserir restrição de documento único no banco de dados para o campo Documento.
//TODO: Inserir indice de pesquisa para o campo NomeCompleto no banco de dados.