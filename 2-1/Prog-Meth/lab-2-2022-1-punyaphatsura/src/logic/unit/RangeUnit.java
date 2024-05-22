package logic.unit;

import java.util.ArrayList;

public class RangeUnit extends BaseUnit {

    public RangeUnit(int startColumn, int startRow, boolean isWhite, String name) {
        super(startColumn, startRow, isWhite, name);
        hp = 2;
    }

    @Override
    public void attack(ArrayList<BaseUnit> targetPieces) {
        if (this.isWhite()) {
            for (BaseUnit ThatUnit : targetPieces) {
                if (this.getRow() == ThatUnit.getRow() - 1 && this.getColumn() == ThatUnit.getColumn()) {
                    System.out.println(this.getName() + " attack " + ThatUnit.getName());
                    ThatUnit.hp = (ThatUnit.getHp() - this.power);

                }
            }
        } else {
            for (BaseUnit ThatUnit : targetPieces) {
                if (this.getRow() == ThatUnit.getRow() + 1 && this.getColumn() == ThatUnit.getColumn()) {
                    System.out.println(this.getName() + " attack " + ThatUnit.getName());
                    ThatUnit.hp = (ThatUnit.getHp() - this.power);
                }
            }

        }
    }
}