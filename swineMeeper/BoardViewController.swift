//
//  BoardViewController.swift
//  swineMeeper
//
//  Created by Naomi Himley on 1/22/15.
//  Copyright (c) 2015 Naomi Himley. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    var logicController = GameLogicController()
    var buttonArray: [BrickButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 200/255.0, green: 85/255.0, blue: 255/255.0, alpha: 1)
        self.logicController.initWithBoard(self)
        self.logicController.layoutBoard()
        for button in buttonArray {
            button.addTarget(self, action: "tapped:", forControlEvents: .TouchUpInside)
        }
    }

    func tapped(tappedBrick: BrickButton) {
        self.logicController.checkIfTouchingABomb(tappedBrick)
        tappedBrick.updateImage(tappedBrick)
        self.logicController.isFirstClick = false
    }
}
