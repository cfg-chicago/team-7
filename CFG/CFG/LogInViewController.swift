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
    
    @IBOutlet var blackOverlay: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //insert actual code here
        
        
       
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