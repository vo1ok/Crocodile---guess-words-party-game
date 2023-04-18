//
//  GameViewController.swift
//  Crocodile game
//
//  Created by Иван Станкин on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var startTimerView: UIView!
   
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startTimerLabel: UILabel!
    
    var timer = Timer()
    
    var timerToStart = Timer()
    
    var seconds = 59
    
    var timeToStart = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "00:\(seconds)"
        startTimerLabel.text = "5"
        
        self.startTimerView.alpha = 0.97
        
        startTimer()

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            
            self.startTimerView.alpha = 0
            self.runTimer()
            
        }
        
        
    }
    

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        showAlert()
        
    }
    
    func runTimer() {
        
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(updateTimer), userInfo: nil, repeats: true)
                                      
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(startTimerUpdate), userInfo: nil, repeats: true)
        
        
    }
                                      
    @objc func updateTimer() {
             
        
             if seconds > 9 {
                 timerLabel.text = "00:\(seconds)"
                 seconds -= 1
                 print(seconds)
             } else if seconds > 0 {
                 timerLabel.text = "00:0\(seconds)"
                 seconds -= 1
                 print(seconds)
             } else {
                 seconds = 0
                 timerLabel.text = "00:0\(seconds)"
                 timer.invalidate()
                 print("timer stopped")
             }
             
             
         }
    
    @objc func startTimerUpdate() {
        
        if timeToStart > 0 {
            startTimerLabel.text = "\(timeToStart)"
            timeToStart -= 1
        } else {
            timeToStart = 0
            startTimerLabel.text = "0"
            timerToStart.invalidate()
        }
        
    }
    
    func showAlert() {
        
            let alert = UIAlertController(title: "Stop the game?", message: "Are you sure you want to stop your game?", preferredStyle: .alert)
              
            alert.addAction(UIAlertAction(title: "Cancel",
                                          style: UIAlertAction.Style.cancel,
                                          handler: { _ in
                
                //Cancel Action
//                self.timer.invalidate()
                
            }))
            alert.addAction(UIAlertAction(title: "Stop",
                                          style: UIAlertAction.Style.destructive,
                                          handler: {(_: UIAlertAction!) in
                
                //Return to main screen action
//                self.timer.invalidate()
                
            }))
             
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            }
              
        }
    

}
