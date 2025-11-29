using MediatR;

namespace LivrariaLotus.Application.Requests.Commands.v1;
public record LoguimUsuarioCommand(string Email, string Senha) : IRequest<string>;