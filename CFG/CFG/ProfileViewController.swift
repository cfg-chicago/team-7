//
//  ProfileViewController.swift
//  CFG
//
//  Created by Ajeet Seenivasan on 9/30/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var highschoolLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser!.uid
        ref.child("users").child(userID).observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot.childrenCount) // I got the expected number of items
                let snap = snapshot as! DataSnapshot
                let data = snap.value as! [String:String]
                self.nameLabel.text = data["fullname"] as! String
                self.highschoolLabel.text = data["highschool"] as! String
                self.yearLabel.text = data["class"] as! String
            
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
