package entity.ingredient;

import entity.base.Choppable;
import entity.base.Cookable;
import entity.base.Ingredient;

public class Meat extends Ingredient implements Choppable, Cookable {

    private boolean chopState;
    private int cookedPercentage;
    public Meat() {
        super("Meat");
        cookedPercentage = 0;
        chopState = false;
    }

    @Override
    public void chop() {
        if(!chopState && cookedPercentage==0){
            chopState = true;
            setName("Minced Meat");
        }

    }

    @Override
    public boolean isChopped() {
        return chopState;
    }

    @Override
    public void cook() {
        if(!chopState){
            cookedPercentage+=10;
            if(0<cookedPercentage && cookedPercentage<=50){
                setName("Raw Meat");
                setEdible(false);
            }
            else if(50<cookedPercentage && cookedPercentage<=80){
                setName("Medium Rare Steak");
                setEdible(true);
            }
            else if(80<cookedPercentage && cookedPercentage<=100){
                setName("Well Done Steak");
                setEdible(true);
            }
            else if(100<cookedPercentage){
                setName("Burnt Steak");
                setEdible(false);
            }
        }else{
            cookedPercentage+=15;
            if(0<cookedPercentage && cookedPercentage<=80){
                setName("Raw Burger");
                setEdible(false);
            }
            else if(80<cookedPercentage && cookedPercentage<=100){
                setName("Cooked Burger");
                setEdible(true);
            }
            else if(100<cookedPercentage){
                setName("Burnt Burger");
                setEdible(false);
            }
        }

    }

    @Override
    public boolean isBurnt() {
        return cookedPercentage>100;
    }

    public int getCookedPercentage(){
        return cookedPercentage;
    }

    public String toString(){
        return this.getName()+" ("+this.getCookedPercentage()+"%)";
    }
}
