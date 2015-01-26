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
    var nearbyMinesValue = 0

    enum DisplayStatus {
        case RaisedBlank
        case RaisedFlagged
        case Depressed1
        case Depressed2
        case Depressed3
        case Depressed4
        case Depressed5
        case Depressed6
        case Depressed7
        case Depressed8
        case DepressedBlank
        case DepressedRevealBomb
        case DepressedHitBomb
    }

    func updateImage(selectedBrick: BrickButton) {
        switch currentDisplayStatus {
        case .RaisedBlank:
            selectedBrick.backgroundColor = UIColor.grayColor()
        case .RaisedFlagged:
            selectedBrick.setTitle("🔺", forState: .Normal)
        case .Depressed1:
            selectedBrick.setTitle("1", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.blueColor(), forState: .Normal)
        case .Depressed2:
            selectedBrick.setTitle("2", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.greenColor(), forState: .Normal)
        case .Depressed3:
            selectedBrick.setTitle("3", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.redColor(), forState: .Normal)
        case .Depressed4:
            selectedBrick.setTitle("4", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        case .Depressed5:
            selectedBrick.setTitle("5", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.magentaColor(), forState: .Normal)
        case .Depressed6:
            selectedBrick.setTitle("6", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.blueColor(), forState: .Normal)
        case .Depressed7:
            selectedBrick.setTitle("7", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.blackColor(), forState: .Normal)
        case .Depressed8:
            selectedBrick.setTitle("8", forState: .Normal)
            selectedBrick.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        case .DepressedBlank:
            selectedBrick.backgroundColor = UIColor.clearColor()
        case .DepressedRevealBomb:
            selectedBrick.setTitle("💣", forState: .Normal)
        case .DepressedHitBomb:
            selectedBrick.setTitle("💣", forState: .Normal)
            selectedBrick.backgroundColor = UIColor.redColor()
        }
    }
}
