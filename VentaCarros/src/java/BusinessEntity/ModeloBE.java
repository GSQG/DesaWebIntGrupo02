package BusinessEntity;

public class ModeloBE {
    private int idModelo;
    private int idMarca;
    private String nombre;
    private String descripcion;
    private int anoLanzamiento;
    private String segmento;

    public int getIdModelo() { return idModelo; }
    public void setIdModelo(int idModelo) { this.idModelo = idModelo; }

    public int getIdMarca() { return idMarca; }
    public void setIdMarca(int idMarca) { this.idMarca = idMarca; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public int getAnoLanzamiento() { return anoLanzamiento; }
    public void setAnoLanzamiento(int anoLanzamiento) { this.anoLanzamiento = anoLanzamiento; }

    public String getSegmento() { return segmento; }
    public void setSegmento(String segmento) { this.segmento = segmento; }
}