struct Team {
    let image: String
    let teamName: String
    var scores: Int
    var turnsCount: Int
    var yourTurn: Bool
}

struct Category {
    let CategoryName: String
    let CategoryWords: [String]
}

struct GameModel {
    var team1: Team?
    var team2: Team?
    var words: [String]?
    var count: Int?
    
    let terms = ["Explain with words.",
                 "Explain with gestures.",
                 "Explain by drawing.",
                 "Explain with anger.",
                 "Explain with facial expressions.",
                 "Explain vulgarly.",
                 "Explain sexy."]
    
    let categories = [
        Category(CategoryName: "Food", CategoryWords: ["Potato", "Pasta", "Cake", "Pie", "Dragon Fruit", "Liver", "Candy", "Bread", "Cherry", "Watermelon", "Milk", "Chiken Breast", "Adjarian Khachapuri", "Khinkali", "Fish", "Sushi", "Pizza", "Coffee", "Куриное мясо", "Apple"]),
        Category(CategoryName: "Animals", CategoryWords: ["Cock", "Bull", "Sheep", "Horse", "Monkey", "Dog", "Python", "Unicorn", "Wolf", "Hydra", "Crave", "Kangoroo", "Honey Badger", "Elephant", "Dolphin", "Octopus", "Manticore", "Human", "Sloth", "Pig"]),
        Category(CategoryName: "People", CategoryWords: ["Elon Mask", "Richard Branson", "Joe Biden", "Alex Lukashenko", "Joseph Stalin", "Juilius Caesar", "Winston Churchill", "Nicola Tesla", "Albert Einstrein", "Vincent van Gogh", "Ivan the Terrible", "Iron Man", "Andry Tate", "Rocky Balboa", "Bansky", "Mr. Beast", "Steve Jobs", "Tim Cook", "Bill Gates", "Warren Buffett"]),
        Category(CategoryName: "Hobbies", CategoryWords: ["Basketball", "Football", "Hockey", "Rugby", "MMA", "Thai Bopxing", "Chess", "Tennis", "Sprint Run", "Baseball", "Cricket", "Cybersport", "Competetive Eating ", "Golf", "Horse Racing", "Racing", "Iron Man", "Swimming", "Diving", "Parachuting"]),
    ]
    
    var teams = [
        Team(image: "command2", teamName: "Awkward Turtles", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "command1", teamName: "Misfit Mavericks", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "command3", teamName: "Flaming Flamingos", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "command4", teamName: "Wacky Wombats", scores: 0, turnsCount: 0, yourTurn: false),
    ]
    
   mutating func getRandomTeam() -> Team {
        let randomInt = Int.random(in: teams.startIndex..<teams.endIndex)
        let randomTeam = teams[randomInt]
        teams.remove(at: randomInt)
        return randomTeam
    }
    
    func getCategory(pressedButtonTitle: String) -> (Int) {
        switch pressedButtonTitle {
        case "Animals": return(0)
        case "Food": return(1)
        case "People": return(2)
        case "Hobbies": return(3)
        default: return(0)
        }
    }

   mutating func getWordsFromCategory(words: [String]){
        var currentWords = words
        var result: [String] = []
        
        for _ in 1...10 {
            let randomInt = Int.random(in: currentWords.startIndex..<currentWords.endIndex)
            result.append(currentWords[randomInt])
            currentWords.remove(at: randomInt)
        }
        self.words = result
    }
    
   mutating func getRandomWord() -> String {
        let currentWords = words!
        let randomInt = Int.random(in: currentWords.startIndex..<currentWords.endIndex)
        let result = currentWords[randomInt]
        words!.remove(at: randomInt)
        return result
    }
    
    func getRandomTerm() -> String {
        if let term = terms.randomElement() {
            return term
        } else {
            return "show it"
        }
    }
    
    func checkTurn(back: String, forward: String) -> String {
        if team1?.turnsCount == 5 && team2?.turnsCount == 5 {
            return forward
        } else {
            return back
        }
    }
    mutating func increseScores() {
        if team1!.yourTurn{
            team1?.scores += 1
        } else if team2!.yourTurn {
            team2?.scores += 1
        }
    }
    mutating func increaseTurnCount() {
        if team1!.yourTurn{
            team1?.turnsCount += 1
            team1?.yourTurn.toggle()
            team2?.yourTurn.toggle()
        } else if team2!.yourTurn {
            team2?.turnsCount += 1
            team1?.yourTurn.toggle()
            team2?.yourTurn.toggle()
        }
    }
}

