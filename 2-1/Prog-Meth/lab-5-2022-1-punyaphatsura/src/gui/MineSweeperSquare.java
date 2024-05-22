package gui;

import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import logic.GameLogic;
import logic.SquareMark;
import logic.SquareState;
import javafx.event.EventHandler;
import javafx.geometry.Insets;

public class MineSweeperSquare extends Pane{
	
	private boolean isDrawn;
	private Color baseColor;
	private int xPosition;
	private int yPosition;
	private final String oURL;
	private final String oneURL;
	private final String mineURL;
	private final String flagURL;
	
	public MineSweeperSquare (int x, int y) {
		oURL = "o.png";
		oneURL = "one.png";
		mineURL = "mine.png";
		flagURL = "flag.png";
		setXPosition(x);
		setYPosition(y);
		this.setPrefWidth(100);
		this.setPrefHeight(100);
		this.setMinWidth(100);
		this.setMinHeight(100);
		setBaseColor(Color.MOCCASIN);
		initializeCellColor();
		this.setOnMouseClicked(event -> onClickHandler());
		
		
	}
	
	private void onClickHandler() {
		if(!GameLogic.getInstance().isGameEnd()) {
			boolean isSecureMode = GameLogic.getInstance().isSecureMode();
			SquareState boardState = GameLogic.getInstance().getBoardState()[xPosition][yPosition];
			if(!isSecureMode) {
				if(boardState!=SquareState.REVEALED) {
					SquareMark boardMark = GameLogic.getInstance().getBoardMark()[xPosition][yPosition];
					
					if(boardMark==SquareMark.ONE) {
						draw(new Image(oneURL),Color.ORANGE);
					}
					else if(boardMark==SquareMark.NOTHING) {
						draw(new Image(oURL),Color.YELLOW);
					}
					else if(boardMark==SquareMark.MINE) {
						draw(new Image(mineURL),Color.RED);
					}
					GameLogic.getInstance().updateState(xPosition,yPosition,SquareState.REVEALED);
				}
				
			}
			
			else if(isSecureMode && !isDrawn()) {
				draw(new Image(flagURL),Color.GREEN);
				GameLogic.getInstance().updateState(xPosition,yPosition,SquareState.SECURED);
				
			}
		}
	}
	
	
	
	private void draw(Image image, Color backgroundColor) {
		BackgroundFill bgFill = new BackgroundFill(backgroundColor, CornerRadii.EMPTY, Insets.EMPTY);
		BackgroundFill[] bgFillA = {bgFill};
		BackgroundSize bgSize = new BackgroundSize(100,100,false,false,false,false);
		BackgroundImage bgImg = new BackgroundImage(image, null, null, null, bgSize);
		BackgroundImage[] bgImgA = {bgImg};
		this.setBackground(new Background(bgFillA,bgImgA));
		setDrawn(true);

	}
	
	public void initializeCellColor() {
		BackgroundFill bgFill = new BackgroundFill(baseColor, CornerRadii.EMPTY, Insets.EMPTY);
		this.setBackground(new Background(bgFill));
		setDrawn(false);
	}
	
	public void setXPosition(int x) {
		xPosition = x;
	}
	
	public void setYPosition(int y) {
		yPosition = y;
	}
	
	public void setBaseColor(Color color) {
		baseColor = color;
	}
	
	public void setDrawn(boolean d) {
		isDrawn = d;
	}
	
	public boolean isDrawn() {return isDrawn;}
	
	public Color getBaseColor() {return baseColor;}
	
	public int getXPosition() {return xPosition;}
	
	public int getYPosition() {return yPosition;}
}
