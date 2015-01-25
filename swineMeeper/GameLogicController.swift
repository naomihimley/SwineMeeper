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
    func initWithBoard(boardVC : BoardViewController) {
        self.boardVC = boardVC;
    }

    func layoutBoard(){
        let widthOfBoard = CGRectGetWidth(self.boardVC.view.frame)
        let widthPerButton = Int(widthOfBoard / 9)
        var x = 0;
        var y = 0;
        var rowCounter = 1;
        for var i = 0; i < 81; i++ {
            var aButton: BrickButton = BrickButton()
            if i % 9 == 0 {// it is the beginning of a new row
                x = 0
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
            self.boardVC.buttonArray.append(aButton)
            self.boardVC.view.addSubview(aButton)
        }
        self.setBombs()
    }

    func setBombs(){
        //this function should set 10 bombs for a 9x9 board at random.
        for button in self.boardVC.buttonArray {
            let random = Int32(arc4random_uniform(1))
            button.isASafeButton = NSNumber(int: random).boolValue
        }
    }

    func checkIfTouchingABomb(selectedBrick: BrickButton){
        let buttonTag = selectedBrick.tag
        var flagTotal = 0
        for brick in self.boardVC.buttonArray {
            if brick.tag == buttonTag - 10 ||
            brick.tag == buttonTag - 9 ||
            brick.tag == buttonTag - 8 ||
            brick.tag == buttonTag - 1 ||
            brick.tag == buttonTag + 1 ||
            brick.tag == buttonTag + 8 ||
            brick.tag == buttonTag + 9 ||
            brick.tag == buttonTag + 10 { // then the brick is touching the selected brick
                if !brick.isASafeButton {
                    flagTotal++
                }
            }
        }
        switch flagTotal {
        case 0 :
            selectedBrick.currentDisplayStatus = .DepressedBlank
        case 1 :
            selectedBrick.currentDisplayStatus = .Depressed1
        case 2 :
            selectedBrick.currentDisplayStatus = .Depressed2
        case 3 :
            selectedBrick.currentDisplayStatus = .Depressed3
        case 4 :
            selectedBrick.currentDisplayStatus = .Depressed4
        default :
            selectedBrick.currentDisplayStatus = .DepressedBlank
        }//TODO: update to go up to 8 since hypothetically it could be completely surrounded by bombs
        selectedBrick.updateImage(selectedBrick)
    }
}
