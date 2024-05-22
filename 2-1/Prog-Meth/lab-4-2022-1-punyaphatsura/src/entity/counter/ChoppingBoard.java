package entity.counter;

import entity.base.Choppable;
import entity.base.Ingredient;
import entity.base.Item;
import logic.Player;

public class ChoppingBoard extends Counter{
    public ChoppingBoard(){
        super("Chopping Board");
    }

    @Override
    public void interact(Player p){
        if (!this.isPlacedContentEmpty()){
            super.interact(p);
        }else{
            Item item = p.getHoldingItem();
            if (item instanceof Ingredient){
                super.interact(p);
                if (item instanceof Choppable){
                    ((Choppable) item).chop();
                }

            }
        }
    }
}
