package com.ajax;

import java.util.HashMap;

/**
 *
 * @author nbuser
 */
public class ComposerData {
    
    private HashMap composers = new HashMap();
    

    public HashMap getComposers() {
        return composers;
    }
    
    public ComposerData() {
        
        
        composers.put("1", new Composer("1", "Theme Cakes"));
        composers.put("2", new Composer("2", "Flavour Cakes"));
        composers.put("3", new Composer("3", "Photo Cakes"));
        composers.put("4", new Composer("4", "Add-Ons"));
        composers.put("5", new Composer("5", "Offers"));
        composers.put("6", new Composer("6", "Fresh Cream Cakes"));
        composers.put("7", new Composer("7", "Premium Cakes"));
        composers.put("8", new Composer("8", "Cheese Cakes"));
        composers.put("9", new Composer("9", "Mousse Cakes"));
        composers.put("10", new Composer("10", "Eggless Cakes"));
        composers.put("11", new Composer("11", "2-Tier Cakes"));
        composers.put("12", new Composer("12", "3-Tier Cakes"));
        composers.put("13", new Composer("13", "Cartoon Cakes"));
        composers.put("14", new Composer("14", "Heart Shaped Cakes"));
        composers.put("15", new Composer("15", "Special Cakes"));
        composers.put("16", new Composer("16", "Wedding Cakes"));
        composers.put("17", new Composer("17", "Birthday Cakes"));
       
    }

}
