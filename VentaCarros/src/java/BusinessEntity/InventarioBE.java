package BusinessEntity;

import java.sql.Timestamp;

public class InventarioBE {
    private int idInventario;
    private int idCarro;
    private int cantidad;
    private String ubicacion;
    private String notas;
    private Timestamp fechaUltimaActualizacion;

    public int getIdInventario() {
        return idInventario;
    }
    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }
    public int getIdCarro() {
        return idCarro;
    }
    public void setIdCarro(int idCarro) {
        this.idCarro = idCarro;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public String getUbicacion() {
        return ubicacion;
    }
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    public String getNotas() {
        return notas;
    }
    public void setNotas(String notas) {
        this.notas = notas;
    }
    public Timestamp getFechaUltimaActualizacion() {
        return fechaUltimaActualizacion;
    }
    public void setFechaUltimaActualizacion(Timestamp fechaUltimaActualizacion) {
        this.fechaUltimaActualizacion = fechaUltimaActualizacion;
    }
}