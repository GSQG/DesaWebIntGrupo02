package BusinessEntity;

public class MetodoPagoBE {
    private int idMetodo;
    private String nombre;
    private String descripcion;
    private boolean inflacionApplicable;

    public int getIdMetodo() {
        return idMetodo;
    }
    public void setIdMetodo(int idMetodo) {
        this.idMetodo = idMetodo;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public boolean isInflacionApplicable() {
        return inflacionApplicable;
    }
    public void setInflacionApplicable(boolean inflacionApplicable) {
        this.inflacionApplicable = inflacionApplicable;
    }
}