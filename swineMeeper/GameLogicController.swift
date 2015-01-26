//
//  GameLogicController.swift
//  swineMeeper
//
//  Created by Naomi Himley on 1/22/15.
//  Copyright (c) 2015 Naomi Himley. All rights reserved.
//

import UIKit
import Foundation

class GameLogicController: NSObject {
    lazy var boardVC = BoardViewController()
    var isFirstClick = true;

    func initWithBoard(boardVC : BoardViewController) {
        self.boardVC = boardVC;
    }

    func layoutBoard(){
        let widthOfBoard = CGRectGetWidth(self.boardVC.view.frame)
        let widthPerButton = Int(widthOfBoard / 9) - 2
        var x = 0;
        var y = 30;
        var rowCounter = 1;
        for var i = 0; i < 81; i++ {
            var aButton: BrickButton = BrickButton()
            if i % 9 == 0 {// it is the beginning of a new row
                x = 2
                rowCounter += widthPerButton;
            } else {
                x += widthPerButton
            }
            y = rowCounter;
            aButton.frame = CGRect(x: x, y: y, width: widthPerButton, height: widthPerButton)
            aButton.currentDisplayStatus = .RaisedBlank
            aButton.tag = i;
            aButton.updateImage(aButton)
            aButton.titleLabel?.font = UIFont.systemFontOfSize(32)
            aButton.layer.borderWidth = 2.0
            aButton.layer.borderColor = UIColor.blackColor().CGColor
            aButton.backgroundColor = UIColor.grayColor()
            self.boardVC.buttonArray.append(aButton)
            self.boardVC.view.addSubview(aButton)
        }
        self.setBombs()
    }

    func setBombs(){
        let totalBricks = self.boardVC.buttonArray.count
        for var i = 0; i < 10; i++ { // ten times pick a random brick from the array and set it as unsafe
            let randomNumber = Int(arc4random()) % totalBricks
            let chosenBrick = self.boardVC.buttonArray[randomNumber]
            if !chosenBrick.isASafeButton { // this button was already chosen to have a bomb
                i--
            }
            else {
                chosenBrick.isASafeButton = false;
            }
        }
        self.markAllButtons()
    }

    func markAllButtons() {
        for brickBeingChecked in self.boardVC.buttonArray {
            var nearbyMines = 0
            for possibleSourroundingBrick in self.boardVC.buttonArray {
                if possibleSourroundingBrick.tag == brickBeingChecked.tag - 10 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag - 9 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag - 8 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag - 1 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag + 1 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag + 8 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag + 9 ||
                    possibleSourroundingBrick.tag == brickBeingChecked.tag + 10 { // then the brick is touching the selected brick
                        if !possibleSourroundingBrick.isASafeButton {
                            nearbyMines++
                        }
                }
            }
            brickBeingChecked.nearbyMinesValue = nearbyMines;
        }
    }

    func checkIfTouchingABomb(selectedBrick: BrickButton){

        if !selectedBrick.isASafeButton {
            if self.isFirstClick {
                //reset the board and let them keep that as their first brick
            }
            else {
                self.playerHitMine(selectedBrick)
                return
            }
        }
        switch selectedBrick.nearbyMinesValue {
        case 0 :
            selectedBrick.currentDisplayStatus = .DepressedBlank
            self.clearSurroundingZoneOfBlanksForButton(selectedBrick)
        case 1 :
            selectedBrick.currentDisplayStatus = .Depressed1
        case 2 :
            selectedBrick.currentDisplayStatus = .Depressed2
        case 3 :
            selectedBrick.currentDisplayStatus = .Depressed3
        case 4 :
            selectedBrick.currentDisplayStatus = .Depressed4
        case 5 :
            selectedBrick.currentDisplayStatus = .Depressed5
        case 6 :
            selectedBrick.currentDisplayStatus = .Depressed6
        case 7 :
            selectedBrick.currentDisplayStatus = .Depressed7
        case 8 :
            selectedBrick.currentDisplayStatus = .Depressed8
        default :
            selectedBrick.currentDisplayStatus = .DepressedBlank
        }
        selectedBrick.updateImage(selectedBrick)
    }

    func clearSurroundingZoneOfBlanksForButton(selectedBrick: BrickButton) {
        // TODO: method to  clear all empty bricks surrounding
    }

    func playerHitMine(selectedBrick: BrickButton) {
        selectedBrick.currentDisplayStatus = .DepressedHitBomb
        selectedBrick.updateImage(selectedBrick)
        for brick in self.boardVC.buttonArray {
            if !brick.isASafeButton {
                brick.currentDisplayStatus = .DepressedRevealBomb
                brick.updateImage(brick)
            }
        }

    }
}
