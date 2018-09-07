package Main;

import DAO.ProdutoDAO;
import DATA.ProdutoDATA;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        int opcao = 0;
        try {
            
            Scanner sc = new Scanner(System.in);

                System.out.println("--------------------");
                System.out.println("1 - LISTAR PRODUTOS");
                System.out.println("2 - INCLUIR PRODUTOS");
                System.out.println("3 - EXCLUIR PRODUTOS");
                System.out.println("4 - ALTERAR PRODUTOS");
                System.out.println("0 - SAIR DA APLICAÇÃO");
                System.out.println("--------------------");

                System.out.println("Digite a opção desejada: ");
            
            do {
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

            } while (opcao != 0);
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
            String Nome = sc.nextLine();
            p.setNome(Nome);

            System.out.println("Digite a descrição do produto: ");
            String Descricao = sc.nextLine();
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
            System.out.println("Erro excluirProduto()");
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
            List<ProdutoDATA> produtosList = new ArrayList<>();

            ProdutoDAO pDAO = new ProdutoDAO();
            int n = produtosList.size();
            for(int i = 0; i < n ; i++){
                System.out.println(produtosList.get(i));
            }
        } catch (Exception e) {
            System.out.println("Erro listarProdutos()");
        }

    }

    private static void alterarProduto() throws ClassNotFoundException, SQLException {
        try {
            Scanner scan = new Scanner(System.in);

            ProdutoDAO pDAO = new ProdutoDAO();
            // Para exibir os produtos cadastrados.

            System.out.println("Digite o ID do produto a ser alterado: ");
            Integer id = scan.nextInt();
            ProdutoDATA p = new ProdutoDATA();
            p.setId(id);
            scan.reset();
            
            System.out.println("Digite o novo nome do produto: ");
            String Nome = scan.nextLine();
            p.setNome(Nome);
            scan.reset();
            
            System.out.println("Digite a nova descrição do produto: ");
            String Desc = scan.nextLine();
            p.setDescricao(Desc);
            scan.reset();
            
            System.out.println("Digite o preço de compra do produto: ");
            Float pcompra = scan.nextFloat();
            p.setPrecoCompra(pcompra);
            scan.reset();
            
            System.out.println("Digite o novo preço de venda do produto: ");
            Float pvenda = scan.nextFloat();
            p.setPrecoVenda(pvenda);
            scan.reset();
            
            System.out.println("Digite a quantidade de produtos em estoque: ");
            Integer estoque = scan.nextInt();
            p.setQuantidade(estoque);
            scan.reset();
            scan.close();
            
            pDAO.alterarProduto(p);

        } catch (Exception e) {
            System.out.println("Erro alterarProduto()");
        }
    }

    private static void exibeProdutosDisponivelParaAlterar() throws ClassNotFoundException, SQLException {
        try {
            Scanner sc = new Scanner(System.in);
            ProdutoDAO pDAO = new ProdutoDAO();
            List<ProdutoDATA> produtosList = pDAO.exibeProdutosDisponivelParaAlterar();
            /* Arrumar a impressão */
            for (ProdutoDATA p : produtosList) {
                System.out.print(p.getId());
                System.out.print(p.getNome());
                System.out.print(p.getDescricao());
                System.out.print(p.getPrecoCompra());
                System.out.print(p.getPrecoVenda());
                System.out.print(p.getQuantidade());
                System.out.print(p.getDataCadastro());
            }
        } catch (Exception e) {
            System.out.println("Erro listarProdutos()");
        }
    }
}
