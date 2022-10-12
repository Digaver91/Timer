//
//  SecondViewController.swift
//  newSportTimer
//
//  Created by Dmytro Gavrylov on 30.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
       
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    var sets: SetList?
    
    
    var secForExercise = 0
    var secForRest = 0
    var timer: Timer?
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        startButton.layer.cornerRadius = 16
        addButton.layer.cornerRadius = 16
        
    }

    @IBAction func startTimer(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        
        vc.nameOfSet = Sets.sets[0].setName
        vc.processTime = Sets.sets[0].setTime
        show(vc, sender: nil)
    }
   
    @IBAction func addSet(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension SecondViewController: UITableViewDelegate {
    
}
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sets.sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? SetListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.set = Sets.sets[indexPath.row]
        return cell
    }
    
    
}
