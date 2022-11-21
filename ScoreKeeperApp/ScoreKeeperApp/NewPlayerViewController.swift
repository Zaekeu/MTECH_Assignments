//
//  NewPlayerViewController.swift
//  ScoreKeeperApp
//
//  Created by Zach on 11/18/22.
//

import UIKit

protocol NewPlayerViewControllerDelegate {
    func newPlayerData(player: String, score: Int)
}

class NewPlayerViewController: UIViewController {
    
    var delegate: NewPlayerViewControllerDelegate?

    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var currentScoreTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let playerText = playerNameTextField.text ?? ""
        let score = Int(currentScoreTextField.text ?? "") ?? 0
        
        delegate?.newPlayerData(player: playerText, score: score)
        
        self.dismiss(animated: false)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
