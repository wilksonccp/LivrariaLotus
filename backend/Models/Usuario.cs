namespace backend.Models;
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public string Email { get; set; }
        public string SenhaHash { get; set; }
        public TipoUsuario Tipo { get; set; }
    }