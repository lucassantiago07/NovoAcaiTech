/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import java.sql.Timestamp;
import java.time.Instant;

/**
 *
 * @author lucas.ssantos57
 */
public class ProdutoDATA {

    private String Nome;
    private String Descricao;
    private float PrecoCompra;
    private float PrecoVenda;
    private int Quantidade;
    private int Id;
    private Timestamp Data;

    public ProdutoDATA() {
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public float getPrecoCompra() {
        return PrecoCompra;
    }

    public void setPrecoCompra(float PrecoCompra) {
        this.PrecoCompra = PrecoCompra;
    }

    public float getPrecoVenda() {
        return PrecoVenda;
    }

    public void setPrecoVenda(float PrecoVenda) {
        this.PrecoVenda = PrecoVenda;
    }

    public int getQuantidade() {
        return Quantidade;
    }

    public void setQuantidade(int Quantidade) {
        this.Quantidade = Quantidade;
    }

    public Timestamp getDataCadastro() {
        return Timestamp.from(Instant.now());
    }
    
    public void setDataCadastro(Timestamp Data){
        this.Data = Data;
    }

}
