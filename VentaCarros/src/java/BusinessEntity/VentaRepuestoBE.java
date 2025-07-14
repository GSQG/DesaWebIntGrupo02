package BusinessEntity;

import java.sql.Timestamp;

public class VentaRepuestoBE {
    private int idVenta;
    private int idRepuesto;
    private String nombreCliente;
    private String direccion;
    private String telefono;
    private String medioPago;
    private String fechaVencimiento;
    private String cvv;
    private Timestamp fechaVenta;
    private double precioVenta;
    private String nombreRepuesto;
    private String marcaRepuesto;
    private int cantidad;
    private String compatibilidadRepuesto;

    // Getters y Setters
    public int getIdVenta() { return idVenta; }
    public void setIdVenta(int idVenta) { this.idVenta = idVenta; }
    public int getIdRepuesto() { return idRepuesto; }
    public void setIdRepuesto(int idRepuesto) { this.idRepuesto = idRepuesto; }
    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }
    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getMedioPago() { return medioPago; }
    public void setMedioPago(String medioPago) { this.medioPago = medioPago; }
    public String getFechaVencimiento() { return fechaVencimiento; }
    public void setFechaVencimiento(String fechaVencimiento) { this.fechaVencimiento = fechaVencimiento; }
    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }
    public Timestamp getFechaVenta() { return fechaVenta; }
    public void setFechaVenta(Timestamp fechaVenta) { this.fechaVenta = fechaVenta; }
    public double getPrecioVenta() { return precioVenta; }
    public void setPrecioVenta(double precioVenta) { this.precioVenta = precioVenta; }
    public String getNombreRepuesto() { return nombreRepuesto; }
    public void setNombreRepuesto(String nombreRepuesto) { this.nombreRepuesto = nombreRepuesto; }
    public String getMarcaRepuesto() { return marcaRepuesto; }
    public void setMarcaRepuesto(String marcaRepuesto) { this.marcaRepuesto = marcaRepuesto; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
    public String getCompatibilidadRepuesto() { return compatibilidadRepuesto; }
    public void setCompatibilidadRepuesto(String compatibilidadRepuesto) { this.compatibilidadRepuesto = compatibilidadRepuesto; }
}