//
//  HomeViewController.swift
//  swineMeeper
//
//  Created by Naomi Himley on 1/20/15.
//  Copyright (c) 2015 Naomi Himley. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var boardContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 120/255.0, green: 220/255.0, blue: 170/255.0, alpha: 1)
    }        
    @IBAction func onResetButtonTapped(sender: AnyObject) {
        //TODO: Delegate method to reset game.
        println("ayy lmao")
    }
}

