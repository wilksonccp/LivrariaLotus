using LivrariaLotus.Domain.ValueObjects;
using LivrariaLotus.Domain.Enums;
namespace LivrariaLotus.Domain.Entities;
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public required VOEmail Email { get; set; }
        public required VOSenha Senha { get; set; }
        public EnumTipoUsuario Tipo { get; set; }
    }