/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.imobiliaria;

import java.util.ArrayList;

/**
 *
 * @author vinic
 */
public class Historico {
    private long id;
    private String disponibilidade;
    private String bairro;
    private String avenida;
    private String estado;
    private String pessoa;
    private String tipo;
    private String quarto;
    private String banheiro;
    private String suite;
    private String garagem;
    private String tamanho;
    private long preco;

    public Historico(long id, String disponibilidade, String bairro, String avenida, String estado, String pessoa, String tipo, String quarto, String banheiro, String suite, String garagem, String tamanho, long preco) {
        this.id = id;
        this.disponibilidade = disponibilidade;
        this.bairro = bairro;
        this.avenida = avenida;
        this.estado = estado;
        this.pessoa = pessoa;
        this.tipo = tipo;
        this.quarto = quarto;
        this.banheiro = banheiro;
        this.suite = suite;
        this.garagem = garagem;
        this.tamanho = tamanho;
        this.preco = preco;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDisponibilidade() {
        return disponibilidade;
    }

    public void setDisponibilidade(String disponibilidade) {
        this.disponibilidade = disponibilidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getAvenida() {
        return avenida;
    }

    public void setAvenida(String avenida) {
        this.avenida = avenida;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPessoa() {
        return pessoa;
    }

    public void setPessoa(String pessoa) {
        this.pessoa = pessoa;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getQuarto() {
        return quarto;
    }

    public void setQuarto(String quarto) {
        this.quarto = quarto;
    }

    public String getBanheiro() {
        return banheiro;
    }

    public void setBanheiro(String banheiro) {
        this.banheiro = banheiro;
    }

    public String getSuite() {
        return suite;
    }

    public void setSuite(String suite) {
        this.suite = suite;
    }

    public String getGaragem() {
        return garagem;
    }

    public void setGaragem(String garagem) {
        this.garagem = garagem;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public long getPreco() {
        return preco;
    }

    public void setPreco(long preco) {
        this.preco = preco;
    }

    public static ArrayList<Historico> getHistorico() throws Exception {
        String SQL = "SELECT * FROM HISTORICO";
        ArrayList<Historico> historico = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Historico h = new Historico(
                    (long) row[0], 
                    (String) row[1],
                    (String) row[2],
                    (String) row[3], 
                    (String) row[4],
                    (String) row[5],
                    (String) row[6],
                    (String) row[7],
                    (String) row[8],
                    (String) row[9],
                    (String) row[10],
                    (String) row[11],
                    (long) row[12]);
            historico.add(h);
        }
        return historico;
    }
    
    public static void addImovel(String disponilibidade ,String bairro, String avenida, String estado, String pessoa, String tipo,
                                String quarto, String banheiro, String suite, String garagem, String tamanho,
                                long preco)
            throws Exception{
        
        String SQL = "INSERT INTO HISTORICO VALUES (default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object parameters[] = {disponilibidade, bairro, avenida, estado, pessoa, tipo, quarto, banheiro, suite, garagem, tamanho, preco};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void compraImovel(long id) throws Exception{
        String SQL_1 = "INSERT INTO HISTORICO SELECT * FROM IMOVEL WHERE ID = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL_1, parameters);
        String SQL = "DELETE FROM IMOVEL WHERE ID = ?";
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeImovel(long id) throws Exception{
        String SQL = "DELETE FROM HISTORICO WHERE ID = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
}