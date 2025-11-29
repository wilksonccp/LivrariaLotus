namespace LivrariaLotus.Domain.ValueObjects;
public class VOEmail
{
    public string EnderecoEmail { get; private set; }
    //TODO: Implementar validação mais robusta de email
    public VOEmail(string enderecoEmail)
    {
        if (string.IsNullOrWhiteSpace(enderecoEmail) || !enderecoEmail.Contains("@"))
        {
            throw new ArgumentException("Endereço de email inválido.");
        }

        EnderecoEmail = enderecoEmail;
    }

    public override string ToString()
    {
        return EnderecoEmail;
    }
}