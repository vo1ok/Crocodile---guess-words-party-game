import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var rulesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesLabel.text = """
    \n
The game is played in teams of two or more.\n
The task of each player of the team is to explain the word that he sees on the screen, following the conditions that are additionally indicated under the hidden word.\n
The more words a team guesses, the more points it will earn.\n
The team with the most points wins.\n
One minute is given to guess the word. \n
If the rules for explaining a word are violated, the move is passed to the next team.
"""
    }
}
