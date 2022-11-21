//
//  ScoreboardTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Zach on 11/18/22.
//

import UIKit

class ScoreboardTableViewController: UITableViewController, NewPlayerViewControllerDelegate, PlayerCellDelegate {

    func updatePlayers(score: Int, row: Int) {
        players[row].currentScore = Int(score)
        players.sort()
        
        tableView.reloadData()
    }
    
    var player: Player?
    
    func newPlayerData(player: String, score: Int) {
        let newPlayer = Player(name: player, currentScore: score)
        players.append(newPlayer)
        players.sort()
        tableView.reloadData()
    }
    
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        players.sort() { $1.currentScore < $0.currentScore }
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        let newPlayer = players[indexPath.row]
        
        cell.row = indexPath.row
        
        cell.update(with: newPlayer)
        cell.showsReorderControl = true
        
        cell.delegate = self
        
        return cell
    }
    @IBSegueAction func segueAction1(_ coder: NSCoder) -> NewPlayerViewController? {
        let newViewController = NewPlayerViewController(coder: coder)
        
        newViewController?.delegate = self
        
        return newViewController
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
