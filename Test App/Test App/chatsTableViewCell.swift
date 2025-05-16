//
//  chatsTableViewCell.swift
//  Test App
//
//  Created by macbook on 15/05/2025.
//

import UIKit

class chatsTableViewCell: UITableViewCell {

    @IBOutlet var userDp: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var msg: UILabel!
    
    static let identifier = "chatsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "chatsTableViewCell", bundle: nil)
    }
    
}
