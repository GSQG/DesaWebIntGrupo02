package BusinessEntity;

public class SedeBE {
    private int idSede;
    private String nombre;
    private String direccion;
    private String telefono;
    private String horario;
    private String ciudad;
    private String estado;

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void agregarSede(int idSede, String nombre, String direccion, String telefono, String horario, String ciudad, String estado) {
        this.idSede = idSede;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.horario = horario;
        this.ciudad = ciudad;
        this.estado = estado;
    }

    public void actualizarSede(String nombre, String direccion, String telefono, String horario, String ciudad, String estado) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.horario = horario;
        this.ciudad = ciudad;
        this.estado = estado;
    }

    public void eliminarSede() {
        this.idSede = 0;
        this.nombre = null;
        this.direccion = null;
        this.telefono = null;
        this.horario = null;
        this.ciudad = null;
        this.estado = null;
    }
}

public class SedeBE {
    private int idSede;
    private String nombre;
    private String direccion;
    private String telefono;
    private String horario;
    private String ciudad;
    private String estado;

    public int getIdSede() { return idSede;
    }

    public void setIdSede(int idSede) { this.idSede = idSede;
    }

    public String getNombre() { return nombre;
    }

    public void setNombre(String nombre) { this.nombre = nombre;
    }

    public String getDireccion() { return direccion;
    }

    public void setDireccion(String direccion) { this.direccion = direccion;
    }

    public String getTelefono() { return telefono;
    }

    public void setTelefono(String telefono) { this.telefono = telefono;
    }

    public String getHorario() { return horario;
    }

    public void setHorario(String horario) { this.horario = horario;
    }

    public String getCiudad() { return ciudad;
    }

    public void setCiudad(String ciudad) { this.ciudad = ciudad;
    }

    public String getEstado() { return estado;
    }

    public void setEstado(String estado) { this.estado = estado;
    }

    public void agregarSede(int idSede, String nombre, String direccion, String telefono, String horario, String ciudad, String estado) {
        this.idSede = idSede;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.horario = horario;
        this.ciudad = ciudad;
        this.estado = estado;
    }

    public void actualizarSede(String nombre, String direccion, String telefono, String horario, String ciudad, String estado) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.horario = horario;
        this.ciudad = ciudad;
        this.estado = estado;
    }

    public void eliminarSede() {
        this.idSede = 0;
        this.nombre = null;
        this.direccion = null;
        this.telefono = null;
        this.horario = null;
        this.ciudad = null;
        this.estado = null;
    }
}