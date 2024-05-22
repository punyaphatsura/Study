package logic;


import java.util.ArrayList;	
import java.util.Arrays;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
public class CardUtil {
	
	public static boolean isExistsInList(UnitCard card, ArrayList<UnitCard> list) {
		
		//TODO: Fill Code
		for (int i=0; i<list.size();i++) {
			if (card.equals(list.get(i))) {
				return true;
			}
		}
		return false;

	}
	
	public static boolean isExistsInList(UnitDeck deck, ArrayList<UnitDeck> list) {
		
		//TODO: Fill Code
		
		for (int i=0; i<list.size();i++) {
			if (deck.equals(list.get(i))){
				return true;
			}
		}
		return false;

	}
	
	public static boolean cardExistsInDeckList(ArrayList<UnitDeck> deckList, UnitCard cardToTest) {
		
		//TODO: Fill Code
		for (int i = 0;i<deckList.size();i++){
			if (deckList.get(i).existsInDeck(cardToTest)){
				return true;
			}
		}
		return false;
	}
	
	public static ArrayList<UnitCard> getCardsFromFile(String filename){
		
		File fileToRead = new File(filename);
		ArrayList<UnitCard> cardsFromFile = new ArrayList<UnitCard>();
		String cardData;
		String[] eachCardData;

		//TODO: Fill Code
		try {
			Scanner myReader = new Scanner(fileToRead);

			while(myReader.hasNextLine()) {				
				cardData = myReader.nextLine();
				eachCardData = cardData.split(",",5);
				
				try {
					cardsFromFile.add(new UnitCard(eachCardData[0],Integer.parseInt(eachCardData[1]),Integer.parseInt(eachCardData[2]),Integer.parseInt(eachCardData[3]),eachCardData[4]));
				}catch (NumberFormatException e){
					System.out.println("File contains string with incorrect format!");
					myReader.close();
					return null;
				}
				
			}

			myReader.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Cannot find file!");
			return null;
		}

		
		
		
		
		return cardsFromFile;
	}

	public static void printCardList(ArrayList<UnitCard> cardList, boolean verbose) {
		
		for(int i = 0; i < cardList.size(); i++) {
			System.out.println(i + ") " + cardList.get(i));
			if(verbose) {
				System.out.println("Blood Cost: " + cardList.get(i).getBloodCost());
				System.out.println(cardList.get(i).getFlavorText());
				if(i < cardList.size()-1) System.out.println("-----");
			}
		}
	}
	
	public static void printDeck(UnitDeck ud) {
		
		if(ud.getCardsInDeck().size() == 0) {
			System.out.println("EMPTY DECK");
		}else {
			for(CardCounter cc : ud.getCardsInDeck()) {
				System.out.println(cc);
			}
		}
		
		System.out.println("Total Cards: " + ud.cardCount());
	}
	
	public static void printDeckList(ArrayList<UnitDeck> deckList) {
		
		
		for(int i = 0; i < deckList.size(); i++) {
			System.out.println(i + ") " + deckList.get(i).getDeckName());
			printDeck(deckList.get(i));
			if(i < deckList.size()-1) System.out.println("-----");
		}
	}
	
	
}
