package entity.counter;

import entity.base.Updatable;
import entity.container.Dish;
import logic.Player;

public class DishWasher extends Counter implements Updatable {
    public DishWasher(){
        super("Dish Washer");
    }
    public void interact(Player p){
        if(!this.isPlacedContentEmpty()){
            super.interact(p);
        }else{
            if(p.getHoldingItem() instanceof Dish){
                if(((Dish) p.getHoldingItem()).getDirty()>0){
                    super.interact(p);
                }
            }
        }
    }
    public void update(){
        if(this.getPlacedContent() instanceof Dish){
            ((Dish) this.getPlacedContent()).clean(15);
        }
    }
}
