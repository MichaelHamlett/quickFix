//
//  FeedViewController.swift
//  quickFix
//
//  Created by Michael Hamlett, Akshay Trikha, Pratyush Kapur on 10/28/17.
//  Copyright © 2017 Michael Hamlett, Akshay Trikha, Pratyush Kapur, Shiv Seetharaman, Maxwell Maleno. All rights reserved.


import UIKit
import FirebaseStorageUI
import Firebase
import FirebaseStorage
import FirebaseDatabase

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var feedTable: UITableView!
    
    
    var complaintsList = [AudioModel]()
    
    var ref: FIRDatabaseReference!
    var refHandle: UInt!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
        
        
        ref = FIRDatabase.database().reference()
        fetchData()
        
        
        print(complaintsList.count)
        print("####################")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableCell", for: indexPath) as! PostTableViewCell
        
        let obj = complaintsList[indexPath.row]
        
        let time = obj.time as! String
        let message = obj.text as! String
        
        cell.modObj = obj
        
        cell.timeLabel.text = message
        cell.messageLabel.text = time
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complaintsList.count
    }
    
    
    func fetchData(){
        
        refHandle = ref.child("audio_files").observe( FIRDataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                print("GREATER THAN 000000", snapshot.childrenCount)
            }
            
            for child in snapshot.children.allObjects as! [FIRDataSnapshot] {
                let complaintObject = child.value as? [String:Any]
                let complaintID = complaintObject?["name"] as! String
                let complaintText = complaintObject?["text"] as! String
                let complaintDownloadURL = complaintObject?["download_url"] as! String
                let complaintTime = complaintObject?["time"] as! String
        
                
                //create the post using Audio Model
                let complaint = AudioModel(id: complaintID, text: complaintText, downloadURL: complaintDownloadURL, time: complaintTime)
            
                self.complaintsList.append(complaint)
            }
            print(self.complaintsList)
            self.feedTable.reloadData()
            
        })
        
    
    
    
//    databaseRef = FIRDatabase.database().reference().child("audio_files");
//    databaseRef.observe(FIRDataEventType.value, with: { (snapshot) in
//
//    if snapshot.childrenCount > 0 {
//
//    //                self.complaintsList.removeAll()
//    for complaints in snapshot.children.allObjects as![FIRDataSnapshot] {
//    let complaintObject = complaints.value as? [String: AnyObject]
//    let complaintID = complaintObject?["name"]
//    let complaintText = complaintObject?["text"]
//    let complaintDownloadURL = complaintObject?["download_url"]
//    let complaintTime = complaintObject?["time"]
//    //                    let complaintDate = complaintObject?["date"]
//
//    let complaint = AudioModel(id: complaintID as! String?, text: complaintText as! String?, downloadURL: complaintDownloadURL as! String?, time: complaintTime as! String?)
//
//    self.complaintsList.append(complaint)
//
//    }
//
//    self.feedTable.reloadData()
//
//    }
//
//
//    })
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
