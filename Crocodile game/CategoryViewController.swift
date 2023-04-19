//
//  CategoryViewController.swift
//  Crocodile game
//
//  Created by Lesya Kotty on 18.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startGamePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGameViewController", sender: self)
    }
    
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToTeamViewController", sender: self)
    }

}
