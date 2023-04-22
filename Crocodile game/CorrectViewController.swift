import UIKit

class CorrectViewController: UIViewController {
    
    var model: GameModel?
    
    @IBOutlet weak var nextTeamLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var teamName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        model?.increaseTurnCount()
    }
    

    
    @IBAction func Turn(_ sender: UIButton) {
        if let destination = model?.checkTurn(back: "backFromWin", forward: "winToResult") {
            performSegue(withIdentifier: destination, sender: sender)
        }
    }
    func updateUI() {
        if (model?.team1!.yourTurn)! {
            teamName.text = model?.team1?.teamName
            scores.text = "\(model!.team1!.scores)"
            image.image = UIImage(named: model!.team1!.image)
            nextTeamLabel.text = "Слудующий ход - \((model?.team2?.teamName)!)"
        } else if (model?.team2!.yourTurn)! {
            teamName.text = model?.team2?.teamName
            scores.text = "\(model!.team2!.scores)"
            image.image = UIImage(named: model!.team2!.image)
            nextTeamLabel.text = "Слудующий ход - \((model?.team1?.teamName)!)"
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backFromWin" {
            guard let gameVC = segue.destination as? GameViewController else {return}
            gameVC.model = model
        } else if segue.identifier == "winToResult" {
            guard let resultVC = segue.destination as? ResultViewController else {return}
            resultVC.model = model
        }
    }
}
