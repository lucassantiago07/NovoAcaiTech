package br.senac.tads.pi3b.ado;

import DAO.ProdutoDAO;
import Data.ProdutoData;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author lucas.ssantos57
 */
public class Principal {
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        
        Scanner sc = new Scanner(System.in);
        
      
        
        
        System.out.println("--------------------");
        System.out.println("1 - LISTAR PRODUTOS");
        System.out.println("2 - INCLUIR PRODUTOS");
        System.out.println("3 - EXCLUIR PRODUTOS");
        System.out.println("4 - ALTERAR PRODUTOS");
        System.out.println("--------------------");
        
        System.out.println("Digite a opção desejada: ");
        int opcao = sc.nextInt();
        
        switch(opcao)
        {
            case 1:
            {
                  incluirProduto();  
            }
            case 2:
            {
                
            }
            case 3:
            {
                    
            }  
            case 4:
            {
                 
            }
            
            
        }
        
  
    }
    
    private static void incluirProduto() throws ClassNotFoundException, SQLException
    {
        Scanner sc = new Scanner(System.in);
        ProdutoData p = new ProdutoData();
       
       
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
        
    }

}
