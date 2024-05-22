package gui;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import logic.GameLogic;

public class ControlPane extends VBox{
	private Text gameText;
	private Button newGameButton;
	private Button secureModeButton;
	private MineSweeperPane mineSweeperPane;
	
	
	public ControlPane (MineSweeperPane mineSweeperPane) {
		this.mineSweeperPane = mineSweeperPane;
		this.setAlignment(Pos.CENTER);
		this.setPrefWidth(300);
		this.setSpacing(20);
		initializeGameText();
		initializeNewGameButton();
		initializeSecureModeButton();
		this.getChildren().add(gameText);
		this.getChildren().add(newGameButton);
		this.getChildren().add(secureModeButton);
	}
	
	private void initializeGameText(){
		gameText = new Text();
		gameText.setText("Tiles left : " + GameLogic.getInstance().getTileCount());
		gameText.setFont(new Font(35));
	}
	
	public void updateGameText(String text) {
		gameText.setText(text);
	}
	
	private void initializeNewGameButton() {
		newGameButton = new Button();
		newGameButton.setText("New Game");
		newGameButton.setPrefWidth(100);
		newGameButton.setOnAction(event -> newGameButtonHandler());
	}
	
	private void initializeSecureModeButton() {
		secureModeButton = new Button();
		secureModeButton.setText("Secure mode : OFF");
		secureModeButton.setPrefWidth(150);
		secureModeButton.setOnAction(event -> secureModeButtonHandler());
	}
	

	private void newGameButtonHandler() {
		GameLogic.getInstance().newGame();
		secureModeButton.setText("Secure mode : OFF");
		updateGameText("Tiles left : "+GameLogic.getInstance().getTileCount());
		mineSweeperPane.getAllCells().stream().forEach(cell -> cell.initializeCellColor());
	}
	
	private void secureModeButtonHandler() {
		GameLogic.getInstance().toggleSecureMode();
		if(!GameLogic.getInstance().isSecureMode()) {
			secureModeButton.setText("Secure mode : OFF");
		}else {
			secureModeButton.setText("Secure mode : ON");
		}
	}
}
