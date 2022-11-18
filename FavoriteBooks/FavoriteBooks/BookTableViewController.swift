import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        let book = books[indexPath.row]
        
        cell.update(with: book)
       
        return cell
    }

    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            books.insert(book, at: indexPath.row)
//          Creates new row when editing don't know why:
//          tableView.deselectRow(at: indexPath, animated: true)
        } else {
            books.append(book)
        }
    }
    @IBSegueAction func editBooks(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return nil }
        
        let book = books[indexPath.row]
        return BookFormTableViewController(coder: coder, book: book)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}
