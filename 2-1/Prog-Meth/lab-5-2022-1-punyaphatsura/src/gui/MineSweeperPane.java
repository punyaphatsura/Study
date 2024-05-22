package gui;

import javafx.scene.paint.Color;
import java.util.ArrayList;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.Border;
import javafx.scene.layout.BorderStroke;
import javafx.scene.layout.BorderStrokeStyle;
import javafx.scene.layout.BorderWidths;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.GridPane;

public class MineSweeperPane extends GridPane{
	private ArrayList<MineSweeperSquare> allCells;
	
	public MineSweeperPane() {
		allCells = new ArrayList<MineSweeperSquare>();
		this.setHgap(8);
		this.setVgap(8);
		this.setPadding(new Insets(8,8,8,8));
		this.setPrefWidth(500);
		this.setAlignment(Pos.CENTER);
		this.setBorder(new Border(new BorderStroke(Color.LIGHTGRAY,BorderStrokeStyle.SOLID,CornerRadii.EMPTY,BorderWidths.DEFAULT)));
		this.setBackground(new Background(new BackgroundFill(Color.WHITE,CornerRadii.EMPTY,Insets.EMPTY)));
		
		for(int x=0;x<5;x++) {
			for(int y=0;y<5;y++) {
				MineSweeperSquare cell = new MineSweeperSquare(x,y);
				allCells.add(cell);
				this.add(cell, x, y);
			}
		}
	}
	
	public ArrayList<MineSweeperSquare> getAllCells(){
		return allCells;
	}

	
}
