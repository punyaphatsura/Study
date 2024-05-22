package card.type;

import card.base.UnitCard;

//You CAN modify the first line
public class NormalUnitCard extends UnitCard {

	
	public NormalUnitCard(String name, String flavorText, int bloodCost, int power, int health) {
		super(name, flavorText, bloodCost, power, health);
	}

	@Override
	public int attackUnit(UnitCard u){
		if (u.getHealth()<this.getPower()) {
			int hp = u.getHealth();
			u.setHealth(u.getHealth() - this.getPower());
			return hp;
		}else{
			u.setHealth(u.getHealth() - this.getPower());
			return this.getPower();
		}
	}
	
	
}

