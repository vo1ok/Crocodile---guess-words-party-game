import UIKit

class RulesViewController: UIViewController {
    

    @IBOutlet weak var rulesText: UILabel!
    var text = """
    \n
    В игру играют командами из двух или более человек.\n

    Задача каждого игрока команды - объяснить слово, которое он видит на экране, следуя условиям, которые дополнительно указаны под загаданным словом.\n

    Чем больше слов отгадала команда, тем больше она заработает баллов.\n

    Выигрывает команда, набравшая больше всего баллов.\n
    
    На отгадывание слова дается одна минуту. \n
    При нарушении правил объяснения слова, ход передается следующей команде.

    ...
    ...
    flprlgprlgpelgplrplgprelgplreglprelgplrepglprelgprelg\n
    flerpglprelgplthpokrgpo,nboymtpnonmpotekpohkge\n
    frglpeplgperlgplerpglerplgperlgplrelgprelgprlgpleprlg
    
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesText.text = text
    }
    
}
