package Main;

import DAO.ProdutoDAO;
import DATA.ProdutoDATA;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        int opcao =0;   
        try {
            
            do{
             
            Scanner sc = new Scanner(System.in);

            System.out.println("--------------------");
            System.out.println("1 - LISTAR PRODUTOS");
            System.out.println("2 - INCLUIR PRODUTOS");
            System.out.println("3 - EXCLUIR PRODUTOS");
            System.out.println("4 - ALTERAR PRODUTOS");
            System.out.println("0 - SAIR DA APLICAÇÃO");
            System.out.println("--------------------");

            System.out.println("Digite a opção desejada: ");
            opcao = sc.nextInt();

            switch (opcao) {
                case 1: {
                    listarProdutos();
                    break;
                }
                case 2: {
                    incluirProduto();
                    break;
                }
                case 3: {
                    excluirProduto();
                    break;
                }
                case 4: {
                    alterarProduto();
                    break;
                }
                default: 
                    System.out.println("Digite uma opção válida");
                    break; 
            }
            
            }
            while (opcao !=0);
        } catch (Exception e) {
            System.out.println("Erro main()");
        }
       System.out.println("Você saiu do programa");
    }

    private static void incluirProduto() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);
            ProdutoDATA p = new ProdutoDATA();

            System.out.println("Digite o nome do produto: ");
            String Nome = sc.next();
            p.setNome(Nome);

            System.out.println("Digite a descrição do produto: ");
            String Descricao = sc.next();
            p.setDescricao(Descricao);

            System.out.println("Digite o preço de compra do produto: ");
            float PrecoCompra = sc.nextFloat();
            p.setPrecoCompra(PrecoCompra);

            System.out.println("Digite o preço de venda do produto: ");
            float PrecoVenda = sc.nextFloat();
            p.setPrecoVenda(PrecoVenda);

            System.out.println("Digite a quantidade do produto: ");
            int Quantidade = sc.nextInt();
            p.setQuantidade(Quantidade);

            ProdutoDAO pDAO = new ProdutoDAO();
            pDAO.incluirProduto(p);
        } catch (Exception e) {
            System.out.println("Erro ao inserir produto()");
        }

    }

    private static void excluirProduto() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);

            System.out.println("Digite o ID do produto para excluir: ");
            Integer id = sc.nextInt();

            ProdutoDAO pDAO = new ProdutoDAO();
            pDAO.excluirProduto(id);
        } catch (Exception e) {
            System.out.println("Erro excluirProduto()");
        }

    }

    private static void listarProdutos() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);

            ProdutoDAO pDAO = new ProdutoDAO();
            exibeProdutosDisponivelParaAlterar();
            
        } catch (Exception e) {
            System.out.println("Erro listarProdutos()");
        }

    }

    private static void alterarProduto() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);

            ProdutoDAO pDAO = new ProdutoDAO();
            // Para exibir os produtos cadastrados.
            exibeProdutosDisponivelParaAlterar();

            System.out.println("Digite o ID do produto a ser alterado: ");
            Integer id = sc.nextInt();
            /*
                Completar Método
            */
        } catch (Exception e) {
            System.out.println("Erro alterarProduto()");
        }
    }
    private static void exibeProdutosDisponivelParaAlterar() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);
            ProdutoDAO pDAO = new ProdutoDAO();
            List<ProdutoDATA> produtosList = pDAO.exibeProdutosDisponivelParaAlterar();
            System.out.println("--------------------------------------");
            System.out.println("LISTANDO OS PRODUTOS");
            System.out.println("--------------------------------------");
            for (ProdutoDATA p : produtosList) {
                System.out.println("ID: "+p.getId());  
                System.out.println("Nome do Produto: "+p.getNome()); 
                System.out.println("Descrição: "+p.getDescricao()); 
                System.out.println("Preço da compra: "+p.getPrecoCompra()); 
                System.out.println("Preço da venda: "+p.getPrecoVenda()); 
                System.out.println("Quantidade do produto: "+p.getQuantidade()); 
                System.out.println("Data do cadastro: "+p.getDataCadastro()); 
                System.out.println("------------------------------------");
            }
        } catch (Exception e) {
            System.out.println("Erro listarProdutos()");
        }
    }
}
