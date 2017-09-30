//
//  LogInViewController.swift
//  CFG
//
//  Created by Ajeet Seenivasan on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import FirebaseAuth

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // init video background and its path
    /*
    var player: AVPlayer?
    let videoURL: NSURL? = Bundle.main.url(forResource: "Background", withExtension: "MOV")! as NSURL
    */
  
    
    @IBAction func signIn(_ sender: Any) {
        if(emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty){
            //print("didint fill out all fields")
            createAlert(title: "Error", message: "Please fill out all fields")
            //insert alert
        }
        else {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                   // print("JESS: Email user authenticated with Firebase")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"tab") as! UITabBarController
                    self.present(viewController, animated: true)
                    
                    
                    
                } else {
                    self.createAlert(title: "Error", message: "Email or password invalid")
                    //print("JESS: DID NOT WORK")
                    
                    
                }
            })
        }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //insert actual code here
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
        
        self.tabBarController?.tabBar.isHidden = true
        
        
        // Adds a black overlay to the looped video in question
        /*
        blackOverlay.alpha = 0.75;
        blackOverlay.layer.zPosition = 0;
        
        // begin implementing the avplayer
        
        player = AVPlayer(url: videoURL as! URL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil, using: { (_) in
            DispatchQueue.main.async {
                self.player?.seek(to: kCMTimeZero)
                self.player?.play()
            }
        })
        
       */
    }
    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated:true, completion:nil)
        } ))
        self.present(alert, animated: true, completion: nil)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
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
