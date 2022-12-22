//
//  RepresentitiveTableViewController.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import UIKit

class RepresentitiveTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var items = [Rep]()
    var controller = RepresentitiveController.self
    
    func fetchMatchingItems() {
        self.items = []
        let searchTerm = searchBar.text ?? ""
        if !searchTerm.isEmpty {
            let query = [
                "zip": searchTerm,
                "output": "json"
            ]
            _ = Task {
                do {
                    let items = try await RepresentitiveController.fetchRepresentitive(zipCode: query)
                    self.items = items
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentitiveCell", for: indexPath) as! RepresentitiveTableViewCell
        let representitiveCell = items[indexPath.row]
        cell.nameLabel.text = representitiveCell.name
        cell.partyLabel.text = "\(representitiveCell.party), \(representitiveCell.state)"
        cell.websiteLabel.text = "Website: \(representitiveCell.link)"
        
        return cell
    }
}
    
extension RepresentitiveTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}

