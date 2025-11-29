using FluentValidation;

namespace LivrariaLotus.Application.Validators;
public class LoguimUsuarioCommandValidator : AbstractValidator<Requests.Commands.v1.LoguimUsuarioCommand>
{
    public LoguimUsuarioCommandValidator()
    {
        RuleFor(x => x.Email)
            .NotEmpty().WithMessage("O email é obrigatório.")
            .EmailAddress().WithMessage("O email fornecido não é válido.");

        RuleFor(x => x.Senha)
            .NotEmpty().WithMessage("A senha é obrigatória.")
            .MinimumLength(6).WithMessage("A senha deve ter pelo menos 6 caracteres.");
    }
}