//
//  ViewController.swift
//  Crocodile game
//
//  Created by Serge on 17.04.23.
//

import UIKit

class TeamViewController: UIViewController {
    @IBOutlet weak var commandField1: UIView!
    @IBOutlet weak var commandField2: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var firstCommandLabel: UILabel!
    @IBOutlet weak var secondCommandLabel: UILabel!
    @IBOutlet weak var backwardButton: UIButton!
    
    let commandNames = ["Cowboys", "Aliens", "Low expectations", "All pain, no gain", "Baby boomers", "Yellow cards", "Spice girls", "Cereal Killers", "X-men", "Hobbits"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set to UIView round corners
        commandField1.layer.cornerRadius = 10
        commandField2.layer.cornerRadius = 10
        
        setCommandNames()
    }
    
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRullesViewController", sender: self)
    }
    
    @IBAction func startGameButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToGameViewController", sender: self)
    }
    
    func setCommandNames() {
        //Generate random name
        let firstName = commandNames.randomElement()
        var secondName = commandNames.randomElement()
        
        //Check names are not repeated
        while secondName == firstName {
            secondName = commandNames.randomElement()
        }
        
        firstCommandLabel.text = firstName
        secondCommandLabel.text = secondName
    }

}

