package logic.unit;

import java.util.ArrayList;

public class BaseUnit {
    private int row;
    private int column;
    private boolean isWhite;
    private String name;
    protected int hp;
    protected int power;
    protected boolean isFlying;

    //    <--------------------- constructor ---------------------------->
    public BaseUnit(int startColumn, int startRow, boolean isWhite, String name) {
        this.isFlying = false;
        this.power = 1;
        this.hp = 2;
        this.setColumn(startColumn);
        this.setRow(startRow);
        this.isWhite = isWhite;
        this.name = name;
    }

//    <--------------------------- getter & setter ------------------------------>

    public int getHp() {
        return hp;
    }

    public int getColumn() {
        return column;
    }

    public int getRow() {
        return row;
    }

    public boolean isFlying() {
        return isFlying;
    }

    public String getName() {
        return name;
    }

    public boolean isWhite() {
        return isWhite;
    }

    public int getPower() {
        return power;
    }


    public void setHp(int HP) {
        hp = HP;
    }

    public void setColumn(int Col) {
        if (Col <= 4 && Col >= 0) {
            column = Col;
        } else if (Col > 4) {
            column = 4;
        } else {
            column = 0;
        }
    }

    public void setRow(int Row) {
        if (Row <= 4 && Row >= 0) {
            row = Row;
        } else if (Row > 4) {
            row = 4;
        } else {
            row = 0;
        }
    }

    public void setFlying(boolean IsFlying) {
        this.isFlying = IsFlying;
    }

    public void setName(String Name) {
        name = Name;
    }

    public void setWhite(boolean IsWhite) {
        this.isWhite = IsWhite;
    }

    public void setPower(int Power) {
        power = Power;
    }


    //    <--------------------------------------- method ------------------------------>
    public boolean move(int direction) {
        switch (direction) {
            case 0:
                if (row + 1 >= 0 && row + 1 <= 4) {
                    row++;
                    return true;
                } else {
                    return false;
                }

            case 1:
                if (column + 1 >= 0 && column + 1 <= 4) {
                    column++;
                    return true;
                } else {
                    return false;
                }

            case 2:
                if (row - 1 >= 0 && row - 1 <= 4) {
                    row--;
                    return true;
                } else {
                    return false;
                }

            case 3:
                if (column - 1 >= 0 && column - 1 <= 4) {
                    column--;
                    return true;
                } else {
                    return false;
                }
            default:
                return false;
        }
    }


    public void attack(ArrayList<BaseUnit> targetPieces) {
        for (BaseUnit ThatUnit : targetPieces) {
            if (!ThatUnit.isFlying() && ((this.row == ThatUnit.getRow()) && (this.column == ThatUnit.getColumn()))) {
                System.out.println(this.getName() + " attack " + ThatUnit.getName());
                ThatUnit.hp = (ThatUnit.getHp() - this.power);

            }
        }
    }
}



