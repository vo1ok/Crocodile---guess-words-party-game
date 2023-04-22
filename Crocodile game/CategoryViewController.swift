//
//  CategoryViewController.swift
//  Crocodile game
//
//  Created by Lesya Kotty on 18.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var model: GameModel?
    var category: Category?
    
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
        if let categoryWords = category?.CategoryWords {
            model?.getWordsFromCategory(words: categoryWords)
            performSegue(withIdentifier: "gameStart", sender: sender)
        }
    }
        
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    func updateCheckMark(_ sender: UIButton) {
        checkMarkAnimals.image = nil
        checkMarkFood.image = nil
        checkMarkPeople.image = nil
        checkMarkHobbies.image = nil
        switch sender.titleLabel?.text {
        case "Animals":
            checkMarkAnimals.image = UIImage(systemName: "checkmark.circle.fill")
            category = model?.categories[(model?.getCategory(pressedButtonTitle: "Animals"))!]
        case "Food":
            checkMarkFood.image = UIImage(systemName: "checkmark.circle.fill")
            category = model?.categories[(model?.getCategory(pressedButtonTitle: "Food"))!]
        case "People":
            checkMarkPeople.image = UIImage(systemName: "checkmark.circle.fill")
            category = model?.categories[(model?.getCategory(pressedButtonTitle: "People"))!]
        default:
            checkMarkHobbies.image = UIImage(systemName: "checkmark.circle.fill")
            category = model?.categories[(model?.getCategory(pressedButtonTitle: "Hobbies"))!]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameStart"{
            guard let gameVC = segue.destination as? GameViewController else {return}
            gameVC.model = model

        }
    }
        
    }

