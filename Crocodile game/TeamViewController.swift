//
//  ViewController.swift
//  Crocodile game
//
//  Created by Serge on 17.04.23.
//

import UIKit

class TeamViewController: UIViewController {
    
    var model: GameModel?
    
    @IBOutlet weak var firstCommandLabel: UILabel!
    @IBOutlet weak var secondCommandLabel: UILabel!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var firstCommandIcon: UIImageView!
    @IBOutlet weak var secondCommandIcon: UIImageView!
    
    let commandNames = ["Cowboys", "Aliens", "Low expectations", "All pain, no gain", "Baby boomers", "Yellow cards", "Spice girls", "Cereal Killers", "X-men", "Hobbits"]
    let commandIcon = [ #imageLiteral(resourceName: "command1"), #imageLiteral(resourceName: "command2"), #imageLiteral(resourceName: "command3"), #imageLiteral(resourceName: "command4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCommandNames()
        setCommandIcon()
    }
    
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRullesViewController", sender: self)
    }
    
    @IBAction func readyButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCategoryViewController", sender: self)
    }
    
    func setCommandNames() {
        let firstName = commandNames.randomElement()
        var secondName = commandNames.randomElement()
        
        while secondName == firstName {
            secondName = commandNames.randomElement()
        }

        firstCommandLabel.text = firstName
        secondCommandLabel.text = secondName
    }
    
    func setCommandIcon() {
        let firstIcon = commandIcon.randomElement()
        var secondIcon = commandIcon.randomElement()
        
        while secondIcon == firstIcon {
            secondIcon = commandIcon.randomElement()
        }
        
        firstCommandIcon.image = firstIcon
        secondCommandIcon.image = secondIcon
    }

}

