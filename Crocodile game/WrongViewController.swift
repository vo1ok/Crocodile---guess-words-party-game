import UIKit

class WrongViewController: UIViewController {
    
    var model: GameModel?
    
    @IBOutlet weak var nextTeamLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var scores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        model?.increaseTurnCount()
    }
    
    @IBAction func Turn(_ sender: UIButton) {
        if let destination = model?.checkTurn(back: "backFromLose", forward: "loseToResult") {
            performSegue(withIdentifier: destination, sender: sender)
        }
    }
    
    func updateUI() {
        if (model?.team1!.yourTurn)! {
            teamName.text = model?.team1?.teamName
            scores.text = "\(model!.team1!.scores)"
            image.image = UIImage(named: model!.team1!.image)
            nextTeamLabel.text = "Next turn - \((model?.team2?.teamName)!)"
        } else if (model?.team2!.yourTurn)! {
            teamName.text = model?.team2?.teamName
            scores.text = "\(model!.team2!.scores)"
            image.image = UIImage(named: model!.team2!.image)
            nextTeamLabel.text = "Next turn - \((model?.team1?.teamName)!)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backFromLose" {
            guard let gameVC = segue.destination as? GameViewController else {return}
            gameVC.model = model
        } else if segue.identifier == "loseToResult" {
            guard let resultVC = segue.destination as? ResultViewController else {return}
            resultVC.model = model
        }
    }
}
