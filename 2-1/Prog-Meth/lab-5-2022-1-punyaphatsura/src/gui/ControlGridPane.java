package gui;

import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;

public class ControlGridPane extends VBox{
	
	private final String miningImageURL;
	private ControlPane controlPane;
	
	
	public ControlGridPane (ControlPane controlPane) {
		this.miningImageURL = "bitcoin.png";
		this.controlPane = controlPane;
		
		ImageView view = new ImageView(miningImageURL);
		view.setFitHeight(150);
		view.setFitWidth(150);
		BorderPane borderPane = new BorderPane();
		borderPane.setPrefHeight(200);
		borderPane.setPrefWidth(150);
		borderPane.setCenter(view);
		this.getChildren().add(borderPane);
		this.getChildren().add(this.controlPane);
	}

}
