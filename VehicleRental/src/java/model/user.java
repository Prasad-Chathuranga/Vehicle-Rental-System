/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Prasad Chathuranga
 */
public class user {
    
    private int uid;
    private String first_name;
    private String last_name;
    private String username;
    private String password;
    private String re_password;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getUser_name() {
        return username;
    }

    public void setUser_name(String user_name) {
        this.username = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRe_password() {
        return re_password;
    }

    public void setRe_password(String re_password) {
        this.re_password = re_password;
    }
    
    
        public boolean isFirstNameFilled() {

        if (!(first_name.isEmpty())) {
            return true;
        } else {
            return false;
        }
    }
        
        public boolean isLastNameFilled() {

        if (!(last_name.isEmpty())) {
            return true;
        } else {
            return false;
        }
    }
    
        public boolean isUserNameFilled() {

        if (!(username.isEmpty())) {
            return true;
        } else {
            return false;
        }
    }
    
     public boolean isPasswordFilled() {

        if (!(password.isEmpty()) ) {
            return true;
        } else {
            return false;
        }
    }
     
     public boolean isRePasswordFilled() {

        if (!(re_password.isEmpty())) {
            return true;
        } else {
            return false;
        }
    }
     
     
}
