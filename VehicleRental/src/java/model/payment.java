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
public class payment {
    
    private int uid;
    private String first_name;
    private String last_name;
    private String username;
    private String payment_type;
    private String amount;
    private String discount;

    
    public payment(int uid, String first_name, String last_name, String username, String payment_type, String discount,String amount) {
        this.uid = uid;
        this.first_name = first_name;
        this.last_name = last_name;
        this.username = username;
        this.payment_type = payment_type;
        this.amount = amount;
        this.discount = discount;
    }

    public payment() {
        
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }
    
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
   

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }
    
    /* Validation in Add New Payment */
    
     public boolean isFirstNameFilled() {

        if (!(first_name.isEmpty())) {
            return true;
        } else {    
            return false;
        }
    }
    
     public boolean isLastNameFilled() {

        if (!(last_name.isEmpty()) ) {
            return true;
        } else {
            return false;
        }
    }
     
      public boolean isUserNameFilled() {

        if (!(username.isEmpty()) ) {
            return true;
        } else {
            return false;
        }
    }

      public boolean isAmountFilled() {

        if (!(amount.isEmpty())) {
            return true;
        } else {
            return false;
        }
    }
      
      
      
}

    



