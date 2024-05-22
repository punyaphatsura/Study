package entity.ingredient;

import entity.base.Choppable;
import entity.base.Ingredient;

public class Lettuce extends Ingredient implements Choppable {
    private boolean chopState;
    public Lettuce() {
        super("Lettuce");
        chopState = false;
        setEdible(true);
    }

    @Override
    public void chop() {
        if (!chopState){
            chopState = true;
            this.setName("Chopped Lettuce");
        }

    }

    @Override
    public boolean isChopped() {
        return chopState;
    }
}
