package data;

import java.sql.Timestamp;
import java.util.ArrayList;

public class VendaData {

    private String id;
    private String idCliente;
    private String idVendedor;
    private String Filial;
    private String valorTotal;
    private String subTotal;
    private String desconto;
    private Timestamp DataDaVenda;
    private ArrayList<ProdutoData> listaDeProtudosDaVenda;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the idCliente
     */
    public String getIdCliente() {
        return idCliente;
    }

    /**
     * @param idCliente the idCliente to set
     */
    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    /**
     * @return the idVendedor
     */
    public String getIdVendedor() {
        return idVendedor;
    }

    /**
     * @param idVendedor the idVendedor to set
     */
    public void setIdVendedor(String idVendedor) {
        this.idVendedor = idVendedor;
    }

    /**
     * @return the valorTotal
     */
    public String getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(String valorTotal) {
        this.valorTotal = valorTotal;
    }

    /**
     * @return the subTotal
     */
    public String getSubTotal() {
        return subTotal;
    }

    /**
     * @param subTotal the subTotal to set
     */
    public void setSubTotal(String subTotal) {
        this.subTotal = subTotal;
    }

    /**
     * @return the desconto
     */
    public String getDesconto() {
        return desconto;
    }

    /**
     * @param desconto the desconto to set
     */
    public void setDesconto(String desconto) {
        this.desconto = desconto;
    }

    /**
     * @return the DataDaVenda
     */
    public Timestamp getDataDaVenda() {
        return DataDaVenda;
    }

    /**
     * @param DataDaVenda the DataDaVenda to set
     */
    public void setDataDaVenda(Timestamp DataDaVenda) {
        this.DataDaVenda = DataDaVenda;
    }

    /**
     * @return the listaDeProtudosDaVenda
     */
    public ArrayList<ProdutoData> getListaDeProtudosDaVenda() {
        return listaDeProtudosDaVenda;
    }

    /**
     * @param listaDeProtudosDaVenda the listaDeProtudosDaVenda to set
     */
    public void setListaDeProtudosDaVenda(ArrayList<ProdutoData> listaDeProtudosDaVenda) {
        this.listaDeProtudosDaVenda = listaDeProtudosDaVenda;
    }

    /**
     * @return the Filial
     */
    public String getFilial() {
        return Filial;
    }

    /**
     * @param Filial the Filial to set
     */
    public void setFilial(String Filial) {
        this.Filial = Filial;
    }

    public void setFilial(Object attribute) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
