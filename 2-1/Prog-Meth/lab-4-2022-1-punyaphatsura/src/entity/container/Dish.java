package entity.container;

import entity.base.Container;
import entity.base.Ingredient;

public class Dish extends Container {
    private int dirty;
    public Dish() {
        super("Dish", 4);
        setDirty(0);
    }

    public Dish(int dirty) {
        super("Dish", 4);
        setDirty(dirty);
    }

    public boolean isDirty(){
        return dirty>0;
    }

    @Override
    public boolean verifyContent(Ingredient i) {
        return !isDirty() && i.isEdible();
    }

    public void setDirty(int dirty) {
        this.dirty = dirty;
        setName("Dish");
        if(dirty<=0) this.dirty=0;
        else{
            setName("Dirty Dish");
        }
    }

    public int getDirty() {
        return dirty;
    }

    public void clean(int amount){
        setDirty(this.dirty-amount);
    }

    public String toString(){
        if(dirty>0) {
            return getName() + " (" + dirty + "%)";
        }else{
            return super.toString();
        }
    }


}
