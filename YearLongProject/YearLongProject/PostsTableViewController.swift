//
//  PostsTableViewController.swift
//  YearLongProject
//
//  Created by Zach on 11/18/22.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var posts: [Post] = [
    Post(name: "John", username: "@John5432", postText: "Just Trying out the new posting Feature in this application to see how it works!"),
    Post(name: "Zayden", username: "@zayTheGreat", postText: "Bunch of random text testing out how well this post will work"),
    Post(name: "Alex", username: "@alexanderWasHere", postText: "Out here trying this new post feature to make it so we have more posts to show"),
    Post(name: "Kate", username: "@KateLastName", postText: "TEXt text text, text was here, need more words for a bigger post to see how well it will look in the actual application and hopefully it looks and runs well but we will see when we test it in the simulator"),
    Post(name: "Jamie", username: "@Jamie_18", postText: "Big new feature for the app hopefully it runs and looks well"),
    Post(name: "Carely", username: "@CC_2913", postText: ";lsakdfjklas;jf;ldsajflajsdflk;jasld fsadf jklasdjflkasjdl; fasdlkjf;lsadjfl"),
    Post(name: "Chris", username: "@SuperChief", postText: "Words for generic looking post full of a lot of words to see how well the posts are working and need a bunch of generic text so that we have more to work with and fix anything that needs to be fixed in case it looks really bad in the actual app so that we can fix it"),
    Post(name: "Camden", username: "@Carl_C_Carl", postText: "Yes theasdj;lfsa adsjfjioas;df asdfas'podfjiosdaj dajsfoija sdfij asdf;oi asdjfiosda; fjsad;oidfsaj"),
    Post(name: "Anthony", username: "@GenericUsername45", postText: "Random numbers to mix it up from words 129384 283419-10329 34092304i3204i 02349 23094i "),
    Post(name: "Cayden", username: "@Nachos_1198", postText: "Just Trying out the new posting Feature in this application to see how it works and so far it looks like its working really well!"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    // not sure if ill need this code but its here if i need it
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostsTableViewCell
        
        let post = posts[indexPath.row]
        cell.update(with: post)
        cell.postLabel?.numberOfLines = 0

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
