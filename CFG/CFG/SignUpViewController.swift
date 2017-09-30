//
//  SignUpViewController.swift
//  CFG
//
//  Created by Ajeet Seenivasan on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccount(_ sender: Any) {
        postToFirebase()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func postToFirebase(){
        
        if let email = emailTextField.text, let pwd = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print("JESS: Unable to authenticate with Firebase using email")
                        //error message
                       
                    } else {
                        print("JESS: Successfully authenticated with Firebase")
                        //transition to main page
                        
                        //if let user = user{
                            
                            //let userData = ["provider": user.providerID]
                            //let userData2 = ["name": self.nameField.text]
                            /*
                             let userData3 = ["imageUrl": imgUrl]
                             self.completeSignIn(id: user.uid, userData: userData, userData2: userData2 as! Dictionary<String, String>, userData3: userData3 as! Dictionary<String, String>)
                             */
                            //self.completeSignIn(id: user.uid, userData: userData, userData2: userData2 as! Dictionary<String, String>)
                        //}
                        
                    }
                })
        
        }
        
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
