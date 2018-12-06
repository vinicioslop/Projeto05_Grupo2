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
public class Banco {
    private long id;
    private String tipo;
    private String bandeira;
    private String numeracao;
    private String nascimento;
    private String vencimento;
    private String proprietario;
    private String codigo;
    private long saldo;

    public Banco(long id, String tipo, String bandeira, String numeracao, String nascimento, String vencimento, String proprietario, String codigo, long saldo) {
        this.id = id;
        this.tipo = tipo;
        this.bandeira = bandeira;
        this.numeracao = numeracao;
        this.nascimento = nascimento;
        this.vencimento = vencimento;
        this.proprietario = proprietario;
        this.codigo = codigo;
        this.saldo = saldo;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getBandeira() {
        return bandeira;
    }

    public void setBandeira(String bandeira) {
        this.bandeira = bandeira;
    }

    public String getNumeracao() {
        return numeracao;
    }

    public void setNumeracao(String numeracao) {
        this.numeracao = numeracao;
    }

    public String getNascimento() {
        return nascimento;
    }

    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }

    public String getVencimento() {
        return vencimento;
    }

    public void setVencimento(String vencimento) {
        this.vencimento = vencimento;
    }

    public String getProprietario() {
        return proprietario;
    }

    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public long getSaldo() {
        return saldo;
    }

    public void setSaldo(long saldo) {
        this.saldo = saldo;
    }
    
    public static ArrayList<Banco> getContas() throws Exception {
        String SQL = "SELECT * FROM BANCO";
        ArrayList<Banco> banco = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Banco b = new Banco(
                    (long) row[0], 
                    (String) row[1],
                    (String) row[2],
                    (String) row[3], 
                    (String) row[4],
                    (String) row[5],
                    (String) row[6],
                    (String) row[7],
                    (long) row[8]);
            banco.add(b);
        }
        return banco;
    }
    
    public static void addConta(long id, String tipo, String bandeira, String numeracao, String nascimento,
                                String vencimento, String proprietario, String codigo, long saldo) throws Exception{
        
        String SQL = "INSERT INTO BANCO VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object parameters[] = {id, tipo, bandeira, numeracao, nascimento, vencimento, proprietario, codigo, saldo};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeConta(long id) throws Exception{
        String SQL = "DELETE FROM BANCO WHERE ID = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
}