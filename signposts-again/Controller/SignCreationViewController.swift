//
//  SignCreationViewController.swift
//  signposts-again
//
//  Created by Connor Worthington on 16/11/2020.
//

import UIKit
import Firebase
import CoreLocation
import MapKit

class SignCreationViewController: UIViewController {
    
    let library = SignLibrary()
    var documents = [QueryDocumentSnapshot]()
    var signText = ""
    var user = Auth.auth().currentUser
    var locManager = CLLocationManager()
    
    @IBOutlet weak var signTextField: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.layer.cornerRadius = 4
        signTextField.becomeFirstResponder()
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
         signText = signTextField.text ?? ""
         // fix to avoid breaking on nil
         if (signTextField.text != "") {
            self.performSegue(withIdentifier: "textEntered", sender: self)
             // library.addNewSign(message: sender.text!)
         }
         signTextField.text = ""
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "textEntered" {
            let vc = segue.destination as! UITabBarController
            let arVC = vc.viewControllers![0] as! AugmentedViewController
            arVC.text = signText
        }
    }
    
    

}
