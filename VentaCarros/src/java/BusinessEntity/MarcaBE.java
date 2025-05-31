package BusinessEntity;

public class MarcaBE {
    private int idMarca;
    private String nombre;
    private String paisOrigen;
    private String sitioWeb;

    public int getIdMarca() {
        return idMarca;
    }
    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getPaisOrigen() {
        return paisOrigen;
    }
    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }
    public String getSitioWeb() {
        return sitioWeb;
    }
    public void setSitioWeb(String sitioWeb) {
        this.sitioWeb = sitioWeb;
    }
}