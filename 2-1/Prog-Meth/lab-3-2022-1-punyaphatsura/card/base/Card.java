package card.base;

//You CAN modify the first line
public abstract class Card implements Cloneable {
	protected String name;
	protected String flavorText;
	protected int bloodCost;

	/// You can modify code below ///
	public Card(String name, String flavorText, int bloodCost) {
		this.name = name;
		this.flavorText = flavorText;
		this.bloodCost = bloodCost;
	}


	abstract public String toString();

	public String getName() {
		return name;
	}

	public int getBloodCost() {
		return bloodCost;
	}

	public String getFlavorText() {
		return flavorText;
	}
	
	/// You can modify code above ///
	
	public boolean equals(Card other) {
		return this.getName().equals(other.getName());
	}
	public Object clone()throws CloneNotSupportedException{  
		return super.clone();  
		}  

	
}