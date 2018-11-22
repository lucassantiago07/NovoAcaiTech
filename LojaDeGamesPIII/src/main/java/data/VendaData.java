package data;

import java.sql.Timestamp;
import java.util.ArrayList;

public class VendaData {

    private Integer id;
    private Integer idCliente;
    private Integer idProdutoVenda;
    private Integer valorTotal;
    private Timestamp DataDaVenda;
    private ArrayList<ProdutosDaVendaData> listaDeProtudosDaVenda;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the idCliente
     */
    public Integer getIdCliente() {
        return idCliente;
    }

    /**
     * @param idCliente the idCliente to set
     */
    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    /**
     * @return the idProdutoVenda
     */
    public Integer getIdProdutoVenda() {
        return idProdutoVenda;
    }

    /**
     * @param idProdutoVenda the idProdutoVenda to set
     */
    public void setIdProdutoVenda(Integer idProdutoVenda) {
        this.idProdutoVenda = idProdutoVenda;
    }

    /**
     * @return the valorTotal
     */
    public Integer getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(Integer valorTotal) {
        this.valorTotal = valorTotal;
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
    public ArrayList<ProdutosDaVendaData> getListaDeProtudosDaVenda() {
        return listaDeProtudosDaVenda;
    }

    /**
     * @param listaDeProtudosDaVenda the listaDeProtudosDaVenda to set
     */
    public void setListaDeProtudosDaVenda(ArrayList<ProdutosDaVendaData> listaDeProtudosDaVenda) {
        this.listaDeProtudosDaVenda = listaDeProtudosDaVenda;
    }

}
