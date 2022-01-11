//
//  ViewController.swift
//  BulleyeUIKIT2
//
//  Created by Владимир Дельгадильо on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var goal: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var round: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSubmit() -> Void {
        let alert = UIAlertController(title: "some title", message: "some message", preferredStyle: .alert)
        let action = UIAlertAction(title: "some action", style: .cancel) {_ in
            self.goal.text = "\(Int.random(in: 1...100))"
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handleStartNewGame() -> Void {
        
    }


}

