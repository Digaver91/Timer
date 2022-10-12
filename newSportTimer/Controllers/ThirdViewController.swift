//
//  ThirdViewController.swift
//  newSportTimer
//
//  Created by Dmytro Gavrylov on 30.09.2022.
//

import UIKit


class ThirdViewController: UIViewController {
    
    
    var sets: SetList?
    var secForExercise = 0
    var secForRest = 0
    var timer: Timer?
    var nameOfSet = ""
    var processTime = ""
    
    @IBOutlet weak var processLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        processLabel.layer.masksToBounds = true
        processLabel.layer.cornerRadius = 16
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 30
       
        
        processLabel.text = nameOfSet
        timeLabel.text = processTime
        startTimer()
    }
    func startTimer() {
        Sets.sets[0].setTime = timeLabel.text ?? ""
        Sets.sets[0].setName = processLabel.text ?? ""
        secForExercise = Int(Sets.sets[0].setTime) ?? 0
        secForRest = Int(Sets.sets[0].restTime) ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSettings), userInfo: nil, repeats: true)
    }
    @objc func timerSettings() {
        if secForExercise > 0 {
            secForExercise -= 1
            timeLabel.text = String(secForExercise)
        } else if secForExercise == 0 {
            processLabel.text = "Rest"
            timeLabel.text = String(secForRest)
            secForRest -= 1
            if secForRest < 0 {
                Sets.sets.removeFirst()
                timer?.invalidate()
                if !Sets.sets.isEmpty {
                    startTimer()
                } else {
                    showEndAlert()
                }
            }
          }
        
    }
    func showEndAlert() {
        let alert = UIAlertController(title: "You Did it!", message: "Nice Job", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
    }
}
