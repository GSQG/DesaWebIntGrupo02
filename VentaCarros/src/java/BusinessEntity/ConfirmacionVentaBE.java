package BusinessEntity;

import java.sql.Timestamp;

public class ConfirmacionVentaBE {
    private int idConfirmacion;
    private int idVenta;
    private Timestamp fechaConfirmacion;
    private String estado;
    private String observaciones;

    public int getIdConfirmacion() {
        return idConfirmacion;
    }

    public void setIdConfirmacion(int idConfirmacion) {
        this.idConfirmacion = idConfirmacion;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public Timestamp getFechaConfirmacion() {
        return fechaConfirmacion;
    }

    public void setFechaConfirmacion(Timestamp fechaConfirmacion) {
        this.fechaConfirmacion = fechaConfirmacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}