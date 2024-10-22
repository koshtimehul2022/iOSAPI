//
//  DetailsVC.swift
//  ApiTest
//
//   Created by admin on 22/10/24.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var txtPunchline: UILabel!
    @IBOutlet weak var txtSetup: UILabel!
    @IBOutlet weak var txtType: UILabel!
    @IBOutlet weak var txtID: UILabel!
    
    var currentJoke : JokeModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        txtID.text = String(currentJoke.id)
        txtType.text = currentJoke.type
        txtSetup.text = currentJoke.setup
        txtPunchline.text = currentJoke.punchline
    }


}
