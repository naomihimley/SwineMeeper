//
//  BrickButton.swift
//  swineMeeper
//
//  Created by Naomi Himley on 1/22/15.
//  Copyright (c) 2015 Naomi Himley. All rights reserved.
//

import UIKit

class BrickButton: UIButton {
    //button properties
    var isASafeButton = true
    var currentDisplayStatus = DisplayStatus.RaisedBlank

    enum DisplayStatus {
        case RaisedBlank
        case RaisedFlagged
        case Depressed1
        case Depressed2
        case Depressed3
        case Depressed4
        case DepressedBlank
        case DepressedRevealBomb
        case DepressedHitBomb
    }

    func updateImage(selectedBrick: BrickButton) {
        switch currentDisplayStatus {
        case .RaisedBlank:
            selectedBrick.setTitle("◼️", forState: .Normal)
        case .RaisedFlagged:
            selectedBrick.setTitle("🔺", forState: .Normal)
        case .Depressed1:
            selectedBrick.setTitle("1️⃣", forState: .Normal)
        case .Depressed2:
            selectedBrick.setTitle("2️⃣", forState: .Normal)
        case .Depressed3:
            selectedBrick.setTitle("3️⃣", forState: .Normal)
        case .Depressed4:
            selectedBrick.setTitle("4️⃣", forState: .Normal)
        case .DepressedBlank:
            selectedBrick.setTitle("◻️", forState: .Normal)
        case .DepressedRevealBomb:
            selectedBrick.setTitle("💣", forState: .Normal)
        case .DepressedHitBomb:
            selectedBrick.setTitle("💣", forState: .Normal)
            selectedBrick.backgroundColor = UIColor.redColor()
        }
    }
    // need a public setter for isASafeButton for the GameLogicController to have access to.
    // Controller tells this model class how to display.
    // Tap events in BoardViewController tell this model to update itself
}
