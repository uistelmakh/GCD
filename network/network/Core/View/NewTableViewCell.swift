//
//  NewTableViewCell.swift
//  network
//
//  Created by Sergey Stelmakh on 28.04.2021.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    static let identifier = "NewTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewTableViewCell", bundle: nil)
    }
    
    
    func configure(_ post: Post) {
        postTitleLabel.text = post.title
        postBodyLabel.text = post.body
    }
}
