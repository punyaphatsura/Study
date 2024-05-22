package logic;

import java.util.ArrayList;

public class UnitDeck {
	private ArrayList<CardCounter> cardsInDeck;
	private String deckName;
	
	public ArrayList<CardCounter> getCardsInDeck() {
		return cardsInDeck;
	}
	
	public String getDeckName() {
		return deckName;
	}
	
	public void setCardsInDeck(ArrayList<CardCounter> cardsInDeck) {
		this.cardsInDeck = cardsInDeck;
	}
	
	public void setDeckName(String deckName) {
		if (deckName.isBlank()) {this.deckName = "Untitled Deck";}
		else {this.deckName = deckName;}
	}
	
	
	public UnitDeck(String deckName) {
		this.setDeckName(deckName);
		this.setCardsInDeck( new ArrayList<CardCounter>());
	}
	
	public void addCard(UnitCard newCard, int count) {
		boolean isNotExist = true;
		if (count>0) {
			for (int i=0;i<this.getCardsInDeck().size();i++) {
				if (newCard.equals((this.getCardsInDeck().get(i)).getCard())) {
					this.getCardsInDeck().get(i).setCount(count+this.getCardsInDeck().get(i).getCount());
					isNotExist = false; 
					break;
				}
			}
			if (isNotExist) {
				cardsInDeck.add(new CardCounter(newCard,count));
			}
		}
		
			
		}
	public boolean isCardInDeck(UnitCard card) {
		for (int i = 0;i<this.getCardsInDeck().size();i++) {
			if (card.equals((this.getCardsInDeck().get(i).getCard()))){return true;}
		}
		return false;
	}
	
	public void removeCard(UnitCard toRemove, int count) {
		if (count<=0) {return;}
		CardCounter c = this.getCardsInDeck().stream().filter(card->card.getCard().equals(toRemove)).findFirst().orElse(null);
		
		if (c==null) {return;}
		
		c.setCount(c.getCount()-count);
		cardsInDeck.removeIf(card->card.getCount()==0);
		
	}
	
	public int cardCount() {
		
		return cardsInDeck.stream().mapToInt(c -> c.getCount()).sum();
	}
	
	public boolean existsInDeck(UnitCard card) {
//		CardCounter c = this.getCardsInDeck().stream().filter(counter->counter.getCard().equals(card)).findFirst().orElse(null);
//		return this.getCardsInDeck().stream().anyMatch(p -> p.getCard().equals(card));
		for (CardCounter i:this.getCardsInDeck()) {
			if (card.equals((i.getCard()))){return true;}
		}
		return false;
		
		
	}
	
	public boolean equals(UnitDeck other) {
		if (this.getDeckName()==other.getDeckName()) {return true;}
		return false;
	}
	
	
	
	
}
