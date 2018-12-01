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
    private String vezesCartao;
    private String numeroComprovante;
    private String bandeira;
    private String valorParcela;
    private String valorEmEspecie;
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
     * @return the vezesCartao
     */
    public String getVezesCartao() {
        return vezesCartao;
    }

    /**
     * @param vezesCartao the vezesCartao to set
     */
    public void setVezesCartao(String vezesCartao) {
        this.vezesCartao = vezesCartao;
    }

    /**
     * @return the numeroComprovante
     */
    public String getNumeroComprovante() {
        return numeroComprovante;
    }

    /**
     * @param numeroComprovante the numeroComprovante to set
     */
    public void setNumeroComprovante(String numeroComprovante) {
        this.numeroComprovante = numeroComprovante;
    }

    /**
     * @return the bandeira
     */
    public String getBandeira() {
        return bandeira;
    }

    /**
     * @param bandeira the bandeira to set
     */
    public void setBandeira(String bandeira) {
        this.bandeira = bandeira;
    }

    /**
     * @return the valorEmEspecie
     */
    public String getValorEmEspecie() {
        return valorEmEspecie;
    }

    /**
     * @param valorEmEspecie the valorEmEspecie to set
     */
    public void setValorEmEspecie(String valorEmEspecie) {
        this.valorEmEspecie = valorEmEspecie;
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
     * @return the valorParcela
     */
    public String getValorParcela() {
        return valorParcela;
    }

    /**
     * @param valorParcela the valorParcela to set
     */
    public void setValorParcela(String valorParcela) {
        this.valorParcela = valorParcela;
    }

   
}
