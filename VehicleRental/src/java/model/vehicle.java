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
public class vehicle {
    
    private int vid;
    private String model;
    private String submodel;
    private String color;
    private String number;

    public vehicle() {
       
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public vehicle(int vid, String model, String submodel, String color, String number) {
        this.vid = vid;
        this.model = model;
        this.submodel = submodel;
        this.color = color;
        this.number = number;
    }
    
}
