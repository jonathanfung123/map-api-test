//
//  ViewController.swift
//  map-api-test
//
//  Created by GF on 10/24/19.
//  Copyright © 2019 67442. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController {

  var db: Firestore!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let settings = FirestoreSettings()

    Firestore.firestore().settings = settings
    // [END setup]
    db = Firestore.firestore()
    getCollection()
  }
  
  private func getCollection() {
       // [START get_collection]
       db.collection("users").getDocuments() { (querySnapshot, err) in
           if let err = err {
               print("Error getting documents: \(err)")
           } else {
               for document in querySnapshot!.documents {
                   print("\(document.documentID) => \(document.data())")
               }
           }
       }
       // [END get_collection]
   }


}

