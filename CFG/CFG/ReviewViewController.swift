//
//  ReviewViewController.swift
//  CFG
//
//  Created by Ajeet Seenivasan on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var question1: UITextField!
    @IBOutlet weak var question2: UITextField!
    @IBOutlet weak var question3: UITextField!
    @IBOutlet weak var question4: UITextField!
    @IBOutlet weak var question5: UITextField!
    @IBOutlet weak var question6: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"tab") as! UITabBarController
        self.present(viewController, animated: true)
    }
    
    var ref: DatabaseReference!
    var journeyID: Int!
    

    @IBAction func submitReview(_ sender: Any) {
        self.ref.child("review").child("test").child("Q1").setValue(question1.text)
        self.ref.child("review").child("test").child("Q2").setValue(question2.text)
        self.ref.child("review").child("test").child("Q3").setValue(question3.text)
        self.ref.child("review").child("test").child("Q4").setValue(question4.text)
        self.ref.child("review").child("test").child("Q5").setValue(question5.text)
        self.ref.child("review").child("test").child("Q6").setValue(question6.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        

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
