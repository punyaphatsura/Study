package logic;

public class CardCounter {
	
	private UnitCard card;
	private int count;
	
	public String toString() {
		return this.getCard() + " x " + this.getCount();
	}
	
	public UnitCard getCard() {
		return card;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCard(UnitCard card) {
		this.card = card;
	}
	
	public void setCount(int count) {
		if (count>0) {
		this.count = count;}
		else {this.count = 0;}
	}
	
	public CardCounter(UnitCard card, int count) {
		this.setCard(card);
		this.setCount(count);
	}
}
