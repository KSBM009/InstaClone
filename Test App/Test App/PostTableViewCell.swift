//
//  PostTableViewCell.swift
//  Test App
//
//  Created by macbook on 14/05/2025.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var postImage: UIImageView!
    @IBOutlet var userDp: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var sendBtn: UIButton!
    
    static let identifier = "PostTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
}
