//
//  ViewController.swift
//  PersistData
//
//   Created by admin on 22/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    @IBAction func nextBTN(_ sender: Any) {
        
        var un = txtUsername.text
        UserDefaults.standard.set(un, forKey: "Username")
        
        performSegue(withIdentifier: "SecondVC", sender: self)

        
    }
    

}

