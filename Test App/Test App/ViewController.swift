//
//  ViewController.swift
//  Test App
//
//  Created by macbook on 13/05/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
//    var storyImg = ["chemban", "nevin", "sulaiman"]
//    var storyUsrName = ["jithin","nevin","sulaiman"]
    
    var postArray:[PostArrayData] = [PostArrayData(postImage: "post1", userDp: "chemban", userName: "jithin"),
                                    PostArrayData(postImage: "post2", userDp: "nevin", userName: "nevin"),
                                    PostArrayData(postImage: "post3", userDp: "sulaiman", userName: "salman")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(StoryTableViewCell.nib(), forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        // Swipe Left Gesture
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipedLeft(){
        let vc: ChatsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatsVC") as! ChatsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as! StoryTableViewCell
            return cell1
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            
          
            
            // Appending the indexpath to avoid story and data conflict
            let indexVal = indexPath.row - 1
            cell.sendBtn.tag = indexPath.row - 1
            cell.sendBtn.addTarget(self, action: #selector(redirectingUser), for: .touchUpInside)
            // Get the items at the current index
            let item = postArray[indexVal]
            
            // Set the items
            cell.postImage.image = UIImage(named: item.postImage)
            cell.userDp.image = UIImage(named: item.userDp)
            cell.userName.text = item.userName
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return  120
        }else{
            return 500
        }
    }
    
    @objc func redirectingUser(sender: UIButton) {
        let userName = postArray[sender.tag].userName
        let vc: ChatsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatsVC") as! ChatsVC
        vc.name = userName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

struct PostArrayData{
    let postImage:String
    let userDp:String
    let userName:String
}
