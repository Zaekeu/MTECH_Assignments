//
//  ViewController.swift
//  ContestRetry
//
//  Created by Zach on 12/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        if emailTextField.text == "" {
            shakeTextField()
        } else {
            performSegue(withIdentifier: "submit", sender: nil)
        }
    }
    func shakeTextField() {
        UIView.animate(withDuration: 0.1, animations: {
            let moveRight = CGAffineTransform(translationX: 20.0, y: 0.0)
            self.emailTextField.transform = moveRight
        }) {(_) in
            UIView.animate(withDuration: 0.1, animations: {
                let moveLeft = CGAffineTransform(translationX: -30.0, y: 0.0)
                self.emailTextField.transform = moveLeft
            }, completion: {(_) in
                UIView.animate(withDuration: 0.1, animations: {
                    let moveCentre = CGAffineTransform(translationX: 0.0, y: 0.0)
                    self.emailTextField.transform = moveCentre
                    self.emailTextField.transform = CGAffineTransform.identity
                })
            })
        }
    }
    
}

