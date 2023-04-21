//
//  CategoryViewController.swift
//  Crocodile game
//
//  Created by Lesya Kotty on 18.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var checkMarkAnimals: UIImageView!
    @IBOutlet weak var checkMarkFood: UIImageView!
    @IBOutlet weak var checkMarkPeople: UIImageView!
    @IBOutlet weak var checkMarkHobbies: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        updateCheckMark(sender)
    }
        
        @IBAction func startGamePressed(_ sender: UIButton) {
            //performSegue(withIdentifier: "goToGameViewController", sender: self)
        }
        
        @IBAction func backwardButtonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "goToTeamViewController", sender: self)
        }
    
    func updateCheckMark(_ sender: UIButton) {
        checkMarkAnimals.image = nil
        checkMarkFood.image = nil
        checkMarkPeople.image = nil
        checkMarkHobbies.image = nil
        
        switch sender.titleLabel?.text {
        case "Animals": checkMarkAnimals.image = UIImage(systemName: "checkmark.circle.fill")
        case "Food": checkMarkFood.image = UIImage(systemName: "checkmark.circle.fill")
        case "People": checkMarkPeople.image = UIImage(systemName: "checkmark.circle.fill")
        default: checkMarkHobbies.image = UIImage(systemName: "checkmark.circle.fill")
        }
    }
        
    }

