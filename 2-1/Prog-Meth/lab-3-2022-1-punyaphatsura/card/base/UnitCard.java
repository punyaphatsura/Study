package card.base;

import player.Player;

//You CAN modify the first line
public abstract class UnitCard extends Card  {
	protected String name;
	protected String flavorText;
	protected int bloodCost;
	protected int power;
	protected int health;
		
	public UnitCard(String name, String flavorText,
					int bloodCost, int power, int health) {
		super(name,flavorText,bloodCost);
		setBloodCost(bloodCost);
		setFlavorText(flavorText);
		setName(name);
		setPower(power);
		setHealth(health);
	}



	public String getName() {
		return this.name;
	}

	public String getFlavorText(){
		return this.flavorText;
	}

	public int getBloodCost(){
		return this.bloodCost;
	}

	public int getPower(){
		return this.power;
	}

	public int getHealth(){
		return this.health;
	}

	public void setName(String n){
		name = n;
	}

	public void setFlavorText(String f){
		flavorText = f;
	}

	public void setBloodCost(int bloodCost) {
		this.bloodCost = Math.max(bloodCost,0);
	}

	public void setPower(int power) {
		this.power = Math.max(power, 0);
	}

	public void setHealth(int health) {
		this.health = Math.max(health, 0);
	}

	public int attackPlayer(Player opponent) {
		opponent.takeDamage(power);
		return opponent.getCurrentDamagePoint();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.getName() + "\tCost: " + this.getBloodCost() +"\t(POW: " + this.getPower() + ", HP: " + this.getHealth() + ")";
	}

	public abstract int attackUnit(UnitCard u);
}
