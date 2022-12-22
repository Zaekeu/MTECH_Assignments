
import UIKit

@MainActor
class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    var items = [StoreItem]()
    var storeItemController = StoreItemController()
    var imageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemCell.classForCoder(), forCellReuseIdentifier: "ItemCell")
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            // set up query dictionary
            
            let query: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "limit": "10",
                "lang": "en_us"
            ]
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
            
            Task {
                do {
                    self.items =  try await storeItemController.fetchItems(matching: query)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
                
            }
        }
    }
    
    
    
    
    
    func configure(cell: ItemCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        cell.name = item.songTitle
        cell.artist = item.artistName
        cell.artworkImage = nil
        
        // set cell.name to the item's name
        
        // set cell.artist to the item's artist
        
        // set cell.artworkImage to nil
        
        // initialize a network task to fetch the item's artwork keeping track of the task
        // in imageLoadTasks so they can be cancelled if the cell will not be shown after
        // the task completes.
        imageLoadTasks[indexPath] = Task {
            do {
                let image = try await storeItemController.fetchImage(from: item.url)
                
                // update the cell's artworkImage
                cell.artworkImage = image
            } catch {
                print("Error fetching image: \(error)")
            }
            
            // if successful, set the cell.artworkImage using the returned image
            imageLoadTasks[indexPath] = nil
        }
    }
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // cancel the image fetching task if we no longer need it
        imageLoadTasks[indexPath]?.cancel()
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
