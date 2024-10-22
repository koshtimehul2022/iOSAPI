//
//  ViewController.swift
//  ApiTest
//
//   Created by admin on 22/10/24.
//

import UIKit

class ViewController: UIViewController{
   
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var jokes: [JokeModel] = []
    
    var currentJoke : JokeModel!
    
    override func viewWillAppear(_ animated: Bool) {
        apiCalling()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jokeData()
    }
    
   func apiCalling(){
       self.loadingIndicator.startAnimating()
       callAPI { res in
           switch res {
           case .success(let data):
               debugPrint(data)
               self.jokes.append(contentsOf: data)
               self.tableView.reloadData()
               self.loadingIndicator.stopAnimating()
               self.loadingIndicator.isHidden = true
               
           case .failure(let error):
               debugPrint(error)
           }
       }
   }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func jokeData(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "jokeCell", bundle: nil), forCellReuseIdentifier: "jokeCell")    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath) as! jokeCell
        cell.jokelbl1.text = jokes[indexPath.row].setup
        cell.jokelbl2.text = jokes[indexPath.row].punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentJoke = jokes[indexPath.row]
        performSegue(withIdentifier: "DetailsVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsVC" {
            if let detailVC = segue.destination as? DetailsVC {
                detailVC.currentJoke = currentJoke
            }
        }
    }
}

