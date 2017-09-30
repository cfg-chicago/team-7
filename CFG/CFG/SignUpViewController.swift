//
//  SignUpViewController.swift
//  CFG
//
//  Created by Ajeet Seenivasan on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
     var ref: DatabaseReference!
    @IBOutlet weak var highSchoolTextField: UITextField!
    
    @IBOutlet weak var classTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccount(_ sender: Any) {
        if(emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || nameTextField.text!.isEmpty ||  highSchoolTextField.text!.isEmpty || classTextField.text!.isEmpty){
            print("error, please fill out fields")
            createAlert(title: "Error", message: "Please fill out all fields")
            //insert an alert
        }
        else{
        postToFirebase()
        }
    }

    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func postToFirebase(){
        ref = Database.database().reference()
        
        if let email = emailTextField.text, let pwd = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print("JESS: Unable to authenticate with Firebase using email")
                        self.createAlert(title: "Error", message: "Email or password invalid")
                       
                    } else {
                        print("JESS: Successfully authenticated with Firebase")
                        //transition to main page
                        
                        if let user = user{
                            self.ref.child("users").child(user.uid).child("fullname").setValue((self.nameTextField.text)!)
                            self.ref.child("users").child(user.uid).child("highschool").setValue((self.highSchoolTextField.text)!)
                            self.ref.child("users").child(user.uid).child("class").setValue((self.classTextField.text)!)
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LogInViewController
                            self.present(nextViewController, animated:true, completion:nil)
                            nextViewController.createAlert(title: "Message", message: "Account created. Please log in")
                            
                           // self.ref.child("users/(user.uid)/fullname").setValue((self.nameTextField.text)!)
                            
                        }
                        
                    }
                })
        
        }
        
    }
   func createAlert (title:String, message:String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated:true, completion:nil)
    } ))
    self.present(alert, animated: true, completion: nil)
    
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
