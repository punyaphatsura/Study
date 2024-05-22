package entity.ingredient;

import entity.base.Cookable;
import entity.base.Ingredient;

public class Egg extends Ingredient implements Cookable {

    private int cookedPercentage;

    public Egg() {
        super("Egg");
        cookedPercentage = 0;
    }

    public int getCookedPercentage() {
        return cookedPercentage;
    }

    public void setCookedPercentage(int cookedPercentage) {
        this.cookedPercentage = cookedPercentage;
    }

    @Override
    public void cook() {
        cookedPercentage+=12;
        if(0<cookedPercentage && cookedPercentage<=50){
            setName("Raw Egg");
            setEdible(false);
        }
        else if(50<cookedPercentage && cookedPercentage<=80){
            setName("Sunny Side Egg");
            setEdible(true);
        }
        else if(80<cookedPercentage && cookedPercentage<=100){
            setName("Fried Egg");
            setEdible(true);
        }
        else if(100<cookedPercentage){
            setName("Burnt Egg");
            setEdible(false);
        }
    }

    @Override
    public boolean isBurnt() {
        return cookedPercentage > 100;
    }
    public String toString(){
        return getName()+" ("+getCookedPercentage()+"%)";
    }
}
