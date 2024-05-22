package card.base;

//You CAN modify the first line
public abstract class SpellCard extends Card {
	protected boolean isBurstSpeed;

	public SpellCard(String name, String flavorText, int bloodCost, boolean isBurstSpeed) {
		super(name, flavorText, bloodCost);
		this.isBurstSpeed = isBurstSpeed;
		setBloodCost(bloodCost);
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getName() + "\tCost: " + this.getBloodCost() +
				"\t(" + (this.getFlavorText()) + ")";
	}

	public boolean isBurstSpeed() {
		return isBurstSpeed;
	}

	public abstract void castSpell(UnitCard unitCard);

	public void setBurstSpeed(boolean isBurstSpeed) {this.isBurstSpeed = isBurstSpeed;}

	public void setName(String name) {this.name = name;}

	public  void setFlavorText(String flavorText) {this.flavorText = flavorText;}

	public void setBloodCost(int bloodCost) {this.bloodCost = Math.max(bloodCost,0);}

}
