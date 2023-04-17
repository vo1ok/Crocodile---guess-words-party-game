//
//  ViewController.swift
//  Crocodile game
//
//  Created by Serge on 17.04.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var commandField1: UIView!
    @IBOutlet weak var commandField2: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commandField1.layer.cornerRadius = 10
        commandField2.layer.cornerRadius = 10
    }


}

