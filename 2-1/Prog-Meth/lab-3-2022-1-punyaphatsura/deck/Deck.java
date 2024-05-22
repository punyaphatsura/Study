package deck;


import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import card.base.Card;


public class Deck {
	// TODO: constructor
	String name;
	Card[] deckList;
	int deckSize;

	private int checkNullLength(Card[] deckList) {
		int count = 0;
		for (Card c:deckList){
			count++;
		}
		return count;
	}


	public Deck(String name, Card[] deckList) {
		this.name = name;
		this.deckList = deckList;
		this.deckSize = checkNullLength(deckList);
	}

	//You CAN modify the first line
		public int insertCard(Card card) throws InsertCardFailedException{
			int count = 0;
			Card[] backup = Arrays.copyOf(deckList,deckSize+1);
			for (Card c:deckList){
				if (c.equals(card)){
					count++;
				}
			}
			if (count >= 4) {
				throw new InsertCardFailedException("You can only put 4 of the same cards into the deck");
			}else{
				backup[deckSize] = card;
				deckList = backup;
				deckSize = backup.length;
			}
			return Math.min(backup.length,deckSize);

			//FILL CODE HERE
			//You can use Arrays.copyOf(Original Array, New Length) to create new arrays with bigger size
			//Must return new deckSize

		}

		//You CAN modify the first line
		public Card removeCard(int slotNumber) throws RemoveCardFailedException {

			if (this.deckList.length <= slotNumber) {
				throw new RemoveCardFailedException("Number you insert exceed deck size");
			} else if (this.deckList[slotNumber] == null) {
				throw new RemoveCardFailedException("There is no card in that slot");
			} else {
				Card c;
				c = deckList[slotNumber];
				this.deckList[slotNumber] = null;
				deckList = Arrays.stream(deckList).filter(Objects::nonNull).toArray(Card[]::new);
				deckSize = deckList.length;
				return c;
			}

			//FILL CODE HERE
			//You can use Arrays.copyOf(Original Array, New Length) to create new arrays with bigger size (Added slot is empty)
			//Once card is removed, other card down the list must rearrange to the empty slot
			//Must return card that was removed
		}

	@Override
	public String toString() {
		return new StringBuilder()
				.append("{").append(this.getName()).append("}")
				.append("(").append(this.getDeckSize()).append(" deck size)")
				.toString();
	}




	/* GETTERS & SETTERS */

	public Card[] getDeckList() {
		return deckList;
	}

	public String  getName() {
		return name;
	}

	public int getDeckSize(){
		return deckSize;
	}

	private void setDeckSize(int deckSize){
		this.deckSize = deckSize;
	}

}
