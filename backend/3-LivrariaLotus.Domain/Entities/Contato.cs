namespace backend.Models;

public class Contato
{
    public int ContatoId { get; set; }
    public Cliente? Cliente { get; set; }
    public Funcionario? Funcionario { get; set; }
    public string Valor { get; set; }
    public EnumTipoContato TipoContato { get; set; }
    public bool Validado { get; set; } = false;
    public bool Preferencial { get; set; } = false;
}
// TODO: Implementar validação de contato (e.g., verificação de email ou número de telefone).
// TODO: Inserir regra para que cada Cliente possa ter apenas um contato preferencial por TipoContato.