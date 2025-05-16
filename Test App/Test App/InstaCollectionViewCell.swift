//
//  InstaCollectionViewCell.swift
//  Test App
//
//  Created by macbook on 13/05/2025.
//

import UIKit

class InstaCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    static let identifier = "InataCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    public func configure(with image: UIImage) {
//        imageView.image = image
//    }
    
    static func nib() -> UINib {
        return UINib(nibName: "InstaCollectionViewCell", bundle: nil)
    }
}
