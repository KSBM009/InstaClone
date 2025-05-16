//
//  ChatsVC.swift
//  Test App
//
//  Created by macbook on 15/05/2025.
//

import UIKit

class ChatsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet var backLabel: UILabel!
    var name:String = "Back"
    var chatArray:[ChatArrayData] = [ChatArrayData(userDp: "chemban", userName: "jithin", msg: "I'm a bald fat ass gay."),
                                    ChatArrayData(userDp: "nevin", userName: "nevin", msg: "I'm trying to be Nivin Pauly."),
                                    ChatArrayData(userDp: "sulaiman", userName: "salman", msg: "I'm a bheekaran.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(chatsTableViewCell.nib(), forCellReuseIdentifier: chatsTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        backLabel.text = name
        
        // Swipe Right Gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight(){
        // Moving Back
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ChatsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chatArray.count
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: chatsTableViewCell.identifier, for: indexPath) as! chatsTableViewCell
        
        if (0..<3).contains(indexPath.row) {
            
            // Get the items at the current index
            let item = chatArray[indexPath.item]
            
            // Set the items
            cell.userDp.image = UIImage(named: item.userDp)
            cell.userName.text = item.userName
            cell.msg.text = item.msg
        } else {
            cell.userDp.image = UIImage(named: "image")
            cell.userName.text = "userName"
            cell.msg.text = "Message sent/recieved"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

struct ChatArrayData{
    let userDp:String
    let userName:String
    let msg:String
}
