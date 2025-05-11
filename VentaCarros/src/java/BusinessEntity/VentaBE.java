package BusinessEntity;

import java.sql.Timestamp;

public class VentaBE {
    private int idVenta;
    private int idCliente;
    private int idUsuario;
    private Timestamp fechaVenta;
    private double total;
    private String estado;
    private String comentarios;
    private String medioVenta;

    public int getIdVenta() { return idVenta; }
    public void setIdVenta(int idVenta) { this.idVenta = idVenta; }

    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int idCliente) { this.idCliente = idCliente; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public Timestamp getFechaVenta() { return fechaVenta; }
    public void setFechaVenta(Timestamp fechaVenta) { this.fechaVenta = fechaVenta; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getComentarios() { return comentarios; }
    public void setComentarios(String comentarios) { this.comentarios = comentarios; }

    public String getMedioVenta() { return medioVenta; }
    public void setMedioVenta(String medioVenta) { this.medioVenta = medioVenta; }
}