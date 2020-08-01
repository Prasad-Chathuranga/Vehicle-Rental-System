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
public class orders {
    
    private int oid;
    private String pickdate;
    private String returndate;
    private String username;
    private String model;
    private String submodel;
    private String color; 

    public orders() {
        
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getPickdate() {
        return pickdate;
    }

    public void setPickdate(String pickdate) {
        this.pickdate = pickdate;
    }

    public String getReturndate() {
        return returndate;
    }

    public void setReturndate(String returndate) {
        this.returndate = returndate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getSubmodel() {
        return submodel;
    }

    public void setSubmodel(String submodel) {
        this.submodel = submodel;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public orders(int oid, String pickdate, String returndate, String username, String model, String submodel, String color) {
        this.oid = oid;
        this.pickdate = pickdate;
        this.returndate = returndate;
        this.username = username;
        this.model = model;
        this.submodel = submodel;
        this.color = color;
    }

    

   
    
}
