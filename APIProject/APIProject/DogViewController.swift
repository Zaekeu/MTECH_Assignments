//
//  DogViewController.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import UIKit

class DogViewController: UIViewController {
    
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var newDogButton: UIButton!
    
    @IBAction func newDogPressed(_ sender: Any) {
        do {
            Task {
                do {
                    let dogItem = try await controller.fetchDog()
                    updateUI(with: dogItem)
                } catch {
                    updateUI(with: error)
                }
            }
        }
    }
    
    let controller = DogItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(systemName: "photo.on.rectangle")
        Task {
            do {
                let dogItem = try await controller.fetchDog()
                updateUI(with: dogItem)
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with dogItem: DogItem) {
        Task {
            do {
                let image = try await controller.fetchImage(from: dogItem.image)
                dogImage.image = image
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with error: Error) {
        title = "ERROR"
        dogImage.image = UIImage(systemName: "exclamationmark.octagon")
    }
}
