//
//  SecondVC.swift
//  PersistData
//
//   Created by admin on 22/10/24.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var txtlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var unm =  UserDefaults.standard.string(forKey: "Username")
        
        txtlbl.text = unm
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
