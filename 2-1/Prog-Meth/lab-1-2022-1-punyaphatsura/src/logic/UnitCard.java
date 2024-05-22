package logic;

public class UnitCard {
	private String name;
	private int bloodCost;
	private int power;
	private int health;
	private String flavorText;

	public String toString() {
		return this.getName() + " (POW: " + this.getPower() + ", HP: " + this.getHealth() + ")";
	}
	
	public String getName() {
		return name;
	}
	
	public int getPower() {
		return power;
	}
	
	public int getHealth() {
		return health;
	}
	
	public int getBloodCost() {
		return bloodCost;
	}
	
	public String getFlavorText() {
		return flavorText;
	}
	
	public UnitCard(String name, int bloodCost, int power, int health, String flavorText) {
		this.setName(name);
		this.setBloodCost(bloodCost);
		this.setPower(power);
		this.setHealth(health);
		this.setFlavorText(flavorText);
	}
	
	public void setName(String name) {
		if (name.isBlank()) {
			this.name = "Creature";
			}
		else {
			this.name = name;
		}
	}
	
	public void setBloodCost(int bloodCost) {
		if (bloodCost>0) {
			this.bloodCost = bloodCost;
		}
		else {
			this.bloodCost = 0;
		}
	}
	
	 public void setPower(int power) {
		 if (power>0) {
				this.power = power;
			}
			else {
				this.power = 0;
			}
	 }
	 
	 public void setHealth(int health) {
		 if (health>1) {
				this.health = health;
			}
			else {
				this.health = 1;
			}
	 }
	 
	 public void setFlavorText(String text) {
		flavorText = text;
		
	}
	 
	 public boolean equals(UnitCard other) {
		 return other.getName().equals(name);
	 }
	 
	 
	
	
}
