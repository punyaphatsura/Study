package card.type;

import card.base.UnitCard;

//You CAN modify the first line
public class LeaderUnitCard extends UnitCard {
	private int buffPower;
	private int buffHealth;
	public LeaderUnitCard(String name, String flavorText, int bloodCost, int power, int health, int buffPower, int buffHealth) {
		super(name, flavorText, bloodCost, power, health);
		setBuffHealth(buffHealth);
		setBuffPower(buffPower);
	}
	
	@Override
	public String toString() {
		return super.getName() + " (POW: " + super.getPower() + ", HP: " + super.getHealth() + 
				" | POW Inc: "+ this.getBuffPower() + ", HP Inc: " + this.getBuffHealth() + ")";
	}

	public int getBuffPower() {
		return buffPower;
	}

	public int getBuffHealth() {
		return buffHealth;
	}

	public void setBuffPower(int bp){
		buffPower = Math.max(bp,0);
	}

	public void setBuffHealth(int bh){
		buffHealth = Math.max(bh,0);
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

	public void buffUnit(UnitCard[] alliesCard){
		for(UnitCard u:alliesCard){
			if (u != null) {
				u.setPower(u.getPower() + this.buffPower);
				u.setHealth(u.getHealth() + this.buffHealth);
			}
		}
	}

}