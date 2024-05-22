package card.type;

import card.base.UnitCard;
import player.Player;

//You CAN modify the first line
public class DebuffUnitCard extends UnitCard {
	private int debuffPower;

	public DebuffUnitCard(String name, String flavorText, int bloodCost, int power, int health, int debuffPower) {
		super(name, flavorText, bloodCost, power, health);
		setDebuffPower(debuffPower);
	}

	public void setDebuffPower(int debuffPower) {
		this.debuffPower = Math.max(debuffPower, 0);;
	}

	public int getDebuffPower() {
		return debuffPower;
	}


	@Override
	public int attackUnit(UnitCard u){
		u.setPower(u.getPower()-this.debuffPower);
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
