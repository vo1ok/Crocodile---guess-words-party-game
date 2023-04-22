//
//  ViewController.swift
//  Crocodile game
//
//  Created by Serge on 17.04.23.
//

import UIKit

class TeamViewController: UIViewController {
    
    var model = GameModel()
    var team1: Team?
    var team2: Team?
    
    @IBOutlet weak var firstCommandLabel: UILabel!
    @IBOutlet weak var secondCommandLabel: UILabel!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var firstCommandIcon: UIImageView!
    @IBOutlet weak var secondCommandIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        model.team1 = team1
        model.team2 = team2
    }
    
    func updateUI() {
        team1 = model.getRandomTeam()
        team1?.yourTurn = true
        team2 = model.getRandomTeam()
        firstCommandIcon.image = UIImage(named: team1!.image)
        firstCommandLabel.text = team1?.teamName
        secondCommandIcon.image = UIImage(named: team2!.image)
        secondCommandLabel.text = team2?.teamName
    }
    
    
    @IBAction func readyButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goBack", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTheme"{
            guard let categoryVC = segue.destination as? CategoryViewController else {return}
            categoryVC.model = model
        }
    }
}

