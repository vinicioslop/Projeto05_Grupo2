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
public class User {
    private long id;
    private String role;
    private String name;
    private String login;
    private long passwordHash;
    
    public User(long id, String role, String name, String login, long passwordHash) {
        this.id = id;
        this.role = role;
        this.name = name;
        this.login = login;
        this.passwordHash = passwordHash;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public long getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(long passwordHash) {
        this.passwordHash = passwordHash;
    }
    
    public static User getUser(String login, String pass) throws Exception {
        
        String SQL = "SELECT * FROM USERS WHERE LOGIN = ? AND PASSWORDHASH = ?";
        Object parameters[] = {login, pass.hashCode()};
        
        
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if (list.isEmpty()){
            return null;
        } else {
            Object row[] = list.get(0);
            User u = new User(
                    (long) row[0], 
                    (String) row[1], 
                    (String) row[2], 
                    (String) row[3], 
                    (long) row[4]);
            return u;
        }
    }
    
    public static ArrayList<User> getUsers() throws Exception {
        String SQL = "SELECT * FROM USERS";
        ArrayList<User> users = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User(
                    (long) row[0], 
                    (String) row[1], 
                    (String) row[2], 
                    (String) row[3], 
                    (long) row[4]);
            users.add(u);
        }
        return users;
    }
    
    public static void addUser(String role, String name, String login, long passwordHash) throws Exception{
        String SQL = "INSERT INTO USERS VALUES (default, ? , ? , ? , ? )";
        Object parameters[] = {role, name, login, passwordHash};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void updateUser(long id, String name, String login, long passwordHash) throws Exception{
        String SQL = "DELETE FROM USERS WHERE ID = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
        
        SQL = "INSERT INTO USERS VALUES (default, ?, ?, ?)";
        Object parameters2[] = {name, login, passwordHash};
        DatabaseConnector.execute(SQL, parameters2);
    }
    
    public static void removeUser(long id) throws Exception{
        String SQL = "DELETE FROM USERS WHERE ID = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
}
