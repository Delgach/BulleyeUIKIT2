import UIKit

class ViewController: UIViewController {
    
    var sliderValue = 50
    var goalValue = 0
    var scoreValue = 0
    var roundValue = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    
    func updateLabels() {
        goal.text = String(goalValue)
        score.text = String(scoreValue)
        round.text = String(roundValue)
    }
    
    func newRound() {
        goalValue = Int.random(in: 1...100)
        roundValue += 1
        slider?.value = Float(sliderValue)
        updateLabels()
    }
    
    func  countThePrecision() -> Int {
        return 100 - abs(sliderValue - goalValue)
    }
    
    func countNewScore() {
        let precision = countThePrecision()
        
        switch precision {
            case 100:
                scoreValue += 200
            case 99:
                scoreValue += 150
            default:
                scoreValue += precision
        }
    }
    
    func addNewRecord() {
        if scoreValue > 0 {
            var toplist = PersistencyHelper.load()
            toplist.append(TopItem(name: "unknow", score: scoreValue))
            PersistencyHelper.save(list: toplist.sorted(by: { $0.score > $1.score }))
        }
    }
    
    
    @IBAction func handleSubmit() {
        let alert = UIAlertController(title: "some title", message: "your chosen \(sliderValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "some action", style: .cancel) {_ in
            self.countNewScore()
            self.sliderValue = Int.random(in: 1...100)
            self.newRound()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handleStartNewGame() {
        addNewRecord()
        roundValue = 0
        scoreValue = 0
        self.sliderValue = Int.random(in: 1...100)
        newRound()
    }

    @IBAction func handleMoveSlider() {
        sliderValue = lroundf(slider.value)
    }

}

