package BusinessEntity;

import java.sql.Timestamp;

public class PagoBE {
    private int idPago;
    private int idVenta;
    private int idMetodo;
    private double monto;
    private String referenciaPago;
    private Timestamp fechaPago;
    private String estado;

    public int getIdPago() {
        return idPago;
    }
    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }
    public int getIdVenta() {
        return idVenta;
    }
    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
    public int getIdMetodo() {
        return idMetodo;
    }
    public void setIdMetodo(int idMetodo) {
        this.idMetodo = idMetodo;
    }
    public double getMonto() {
        return monto;
    }
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public String getReferenciaPago() {
        return referenciaPago;
    }
    public void setReferenciaPago(String referenciaPago) {
        this.referenciaPago = referenciaPago;
    }
    public Timestamp getFechaPago() {
        return fechaPago;
    }
    public void setFechaPago(Timestamp fechaPago) {
        this.fechaPago = fechaPago;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
}