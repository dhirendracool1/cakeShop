package com.ajax;

public class Composer {

    private String id;
    private String firstName;
    public Composer (String id, String firstName) {
        this.id = id;
        this.firstName = firstName;
   }

    
    public String getId() {
        return id;
    }
    
    public String getFirstName() {
        return firstName;
    }

}