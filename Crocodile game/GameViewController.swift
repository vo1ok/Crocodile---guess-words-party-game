//  Created by Иван Станкин on 17.04.2023.
import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var model: GameModel?
    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var goToLose: UIButton!
    @IBOutlet weak var startTimerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startTimerLabel: UILabel!
    
    var timer = Timer()
    var timerToStart = Timer()
    var seconds = 59
    var timeToStart = 5
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:\(seconds)"
        startTimerLabel.text = "\(timerToStart)"
        self.startTimerView.alpha = 0.97
        startTimer()
        countdownSound()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.updateUI()
            self.startTimerView.alpha = 0
            self.runTimer()
        }
    }
    func updateUI() {
        wordLabel.text = model?.getRandomWord()
        termLabel.text = model?.getRandomTerm()
    }
    

    @IBAction func rightButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        playSound(soundName: "right")
        model?.increseScores()
        performSegue(withIdentifier: "goToWin", sender: sender)
    }
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        playSound(soundName: "wrong")
        performSegue(withIdentifier: "goToLose", sender: sender)
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
        switch seconds {
        case 11...59:
            timerLabel.text = "00:\(seconds)"
            seconds -= 1
        case 10:
            timerLabel.text = "00:10"
            playSound(soundName: "countdown")
            seconds -= 1
        case 1...9:
            timerLabel.text = "00:0\(seconds)"
            seconds -= 1
        default:
            seconds = 0
            timerLabel.text = "00:0\(seconds)"
            timer.invalidate()
            performSegue(withIdentifier: "goToLose", sender: goToLose)
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
                
                //self.timer.invalidate()
                
            }))
            alert.addAction(UIAlertAction(title: "Yes",
                                          style: UIAlertAction.Style.destructive,
                                          handler: {(_: UIAlertAction!) in
                self.timer.invalidate()
               // performSegue(withIdentifier: "cancelToStart", sender: UIAlertAction)
            }))
             
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWin"{
            guard let correctVC = segue.destination as? CorrectViewController else {return}
            correctVC.model = model
        } else if segue.identifier == "goToLose" {
            guard let wrongVC = segue.destination as? WrongViewController else {return}
            wrongVC.model = model
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func countdownSound() {
        if seconds == 10 {
            playSound(soundName: "countdown")
        }
    }
}
