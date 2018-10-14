package data;

import java.sql.Timestamp;

public class ProdutoData {
    
    
// ----------------------------------------------------------
//
//
//
//
//                AJUSTAR!!!!!!!
//         APENAS EXEMPLO. PARA AJUDAR
//
//
//
//
//
// ----------------------------------------------------------



    private int Id;
    private String Nome; 
    private String Descricao; 
    private float PrecoDeCusto; 
    private float PrecoDeVenda;
    private int Categoria;
    private int Estoque;
    private Timestamp DataCadastro;

    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the Nome
     */
    public String getNome() {
        return Nome;
    }

    /**
     * @param Nome the Nome to set
     */
    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    /**
     * @return the Descricao
     */
    public String getDescricao() {
        return Descricao;
    }

    /**
     * @param Descricao the Descricao to set
     */
    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    /**
     * @return the PrecoDeCusto
     */
    public float getPrecoDeCusto() {
        return PrecoDeCusto;
    }

    /**
     * @param PrecoDeCusto the PrecoDeCusto to set
     */
    public void setPrecoDeCusto(float PrecoDeCusto) {
        this.PrecoDeCusto = PrecoDeCusto;
    }

    /**
     * @return the PrecoDeVenda
     */
    public float getPrecoDeVenda() {
        return PrecoDeVenda;
    }

    /**
     * @param PrecoDeVenda the PrecoDeVenda to set
     */
    public void setPrecoDeVenda(float PrecoDeVenda) {
        this.PrecoDeVenda = PrecoDeVenda;
    }

    /**
     * @return the Categoria
     */
    public int getCategoria() {
        return Categoria;
    }

    /**
     * @param Categoria the Categoria to set
     */
    public void setCategoria(int Categoria) {
        this.Categoria = Categoria;
    }

    /**
     * @return the Estoque
     */
    public int getEstoque() {
        return Estoque;
    }

    /**
     * @param Estoque the Estoque to set
     */
    public void setEstoque(int Estoque) {
        this.Estoque = Estoque;
    }

    /**
     * @return the DataCadastro
     */
    public Timestamp getDataCadastro() {
        return DataCadastro;
    }

    /**
     * @param DataCadastro the DataCadastro to set
     */
    public void setDataCadastro(Timestamp DataCadastro) {
        this.DataCadastro = DataCadastro;
    }

   

}
