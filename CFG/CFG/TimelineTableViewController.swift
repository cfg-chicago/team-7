//
//  FeedViewController.swift
//  InstagramLike
//
//  Created by Vasil Nunev on 13/12/2016.
//  Copyright © 2016 Vasil Nunev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TimelineTableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    var ref: DatabaseReference!
    let userID = Auth.auth().currentUser!.uid
    
    var journeys = [Journey]()
    var following = [String]()
    var journeyID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionview.delegate = self
        
        fetchPosts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let review = segue.destination as? ReviewViewController {
            review.journeyID = self.journeyID
        }
    }
    
    
    func fetchPosts(){
        
        let ref = Database.database().reference()
        
        ref.child("Journey").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot.childrenCount) // I got the expected number of items
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
            
            
                let journ = Journey()
                let snap = rest as! DataSnapshot
                let dict = snap.value as! [String : AnyObject]
                //implement functionality for checking if user belongs to journey first
                    journ.companyName = dict["Company_Name"] as! String
                    journ.journeyName = dict["Journey_Name"] as! String
                    journ.imagePath = dict["Image"] as! String
                
                    journ.date = dict["Date"] as! String
                
                    journ.reflection = dict["Reflection"] as! String
                
                    self.journeys.append(journ)
                self.collectionview.reloadData()
            }
        })
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.journeys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "journeyCell", for: indexPath) as! JourneyCollectionViewCell
        
        journeyID = self.journeys[indexPath.row].journeyID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"review") as! ReviewViewController
        self.present(viewController, animated: true)
        
        


   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "journeyCell", for: indexPath) as! JourneyCollectionViewCell
        
        cell.imageView.downloadImage(from: self.journeys[indexPath.row].imagePath)
        cell.imageView?.alpha = 0.8
        cell.journeyNameTextField.text = self.journeys[indexPath.row].journeyName
        cell.companyNameTextField.text = self.journeys[indexPath.row].companyName
        cell.reflection.text = self.journeys[indexPath.row].reflection as String!
        cell.date.text = self.journeys[indexPath.row].date as String!
        
        return cell
    }
 
    
    class CircularTableViewCell: UITableViewCell {
        @IBOutlet weak var circularImageView: UIImageView!
        override func layoutSubviews() {
            circularImageView.layer.cornerRadius = circularImageView.bounds.height / 2
            circularImageView.clipsToBounds = true
        }
    }
    
}

extension UIImageView {
    func downloadImage(from imgURL: String!) {
        let url = URLRequest(url: URL(string: imgURL)!)
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
                
        }
        task.resume()
    }
}



