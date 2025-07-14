package BusinessEntity;

import java.sql.Timestamp;

public class VentaBE {
    private int idVenta;
    private int idCarro;
    private String nombreCliente;
    private String direccion;
    private String telefono;
    private String medioPago;
    private String fechaVencimiento;
    private String cvv;
    private Timestamp fechaVenta;
    private double precioVenta;
    private String modeloCarro;
    private int anoCarro;
    private String colorCarro;
    private String estadoCarro;
    private int kilometrajeCarro;
    private String tipoCombustibleCarro;
    private String transmisionCarro;

    public int getIdVenta() { return idVenta; }
    public void setIdVenta(int idVenta) { this.idVenta = idVenta; }
    public int getIdCarro() { return idCarro; }
    public void setIdCarro(int idCarro) { this.idCarro = idCarro; }
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
    public String getModeloCarro() { return modeloCarro; }
    public void setModeloCarro(String modeloCarro) { this.modeloCarro = modeloCarro; }
    public int getAnoCarro() { return anoCarro; }
    public void setAnoCarro(int anoCarro) { this.anoCarro = anoCarro; }
    public String getColorCarro() { return colorCarro; }
    public void setColorCarro(String colorCarro) { this.colorCarro = colorCarro; }
    public String getEstadoCarro() { return estadoCarro; }
    public void setEstadoCarro(String estadoCarro) { this.estadoCarro = estadoCarro; }
    public int getKilometrajeCarro() { return kilometrajeCarro; }
    public void setKilometrajeCarro(int kilometrajeCarro) { this.kilometrajeCarro = kilometrajeCarro; }
    public String getTipoCombustibleCarro() { return tipoCombustibleCarro; }
    public void setTipoCombustibleCarro(String tipoCombustibleCarro) { this.tipoCombustibleCarro = tipoCombustibleCarro; }
    public String getTransmisionCarro() { return transmisionCarro; }
    public void setTransmisionCarro(String transmisionCarro) { this.transmisionCarro = transmisionCarro; }
}