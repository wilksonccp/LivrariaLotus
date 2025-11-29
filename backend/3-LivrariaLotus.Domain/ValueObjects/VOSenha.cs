namespace LivrariaLotus.Domain.ValueObjects;
public class VOSenha
{
    public string Senha { get; private set; }
    //TODO: Implementar hash de senha
    //TODO: Implementar regras de complexidade de senha (se ao menos um número, uma letra maiúscula, uma letra minúscula e um caractere especial)
    public VOSenha(string senha)
    {
        if (string.IsNullOrWhiteSpace(senha) || senha.Length < 6)
        {
            throw new ArgumentException("Senha inválida. A senha deve ter pelo menos 6 caracteres.");
        }

        Senha = senha;
    }

    public override string ToString()
    {
        return Senha;
    }
}