//
//  PostsTableViewCell.swift
//  YearLongProject
//
//  Created by Zach on 11/18/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    func update(with post: Post) {
        nameLabel.text = post.name
        usernameLabel.text = post.username
        postLabel.text = post.postText
        nameLabel.textColor = .white
        usernameLabel.textColor = .white
        postLabel.textColor = .white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
