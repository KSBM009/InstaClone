//
//  StoryTableViewCell.swift
//  Test App
//
//  Created by macbook on 14/05/2025.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    static let identifier = "StoryTableViewCell"
    
    var storyArray:[StoryArrayData] = [StoryArrayData(image: "stephen", userName: "stephen"),
                                       StoryArrayData(image: "nevin", userName: "nevin"),
                                        StoryArrayData(image: "sulaiman", userName: "salman"),
                                       StoryArrayData(image: "chemban", userName: "jithin"),
                                        StoryArrayData(image: "dude", userName: "jojo")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(InstaCollectionViewCell.nib(), forCellWithReuseIdentifier: InstaCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
}

//extension StoryTableViewCell: UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        print("Ouch! You have tapped me.")
//    }
//}

extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstaCollectionViewCell.identifier, for: indexPath) as! InstaCollectionViewCell
       
        // Get the items at the current index
        let item = storyArray[indexPath.item]
        
        // Set the image and text in the cell
        cell.imageView.image = UIImage(named: item.image)
        cell.textLabel.text = item.userName
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

struct StoryArrayData{
    let image:String
    let userName:String
}
