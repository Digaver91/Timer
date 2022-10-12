//
//  ViewController.swift
//  newSportTimer
//
//  Created by Dmytro Gavrylov on 30.09.2022.
//

import UIKit

class ViewController: UIViewController {
   
    var setList: SetList?
    
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 16
    }
    
    @IBAction func showAlertController(_ sender: Any) {
        
        // 1.
        var setName: UITextField?
        var setSec: UITextField?
        var restSec: UITextField?
        // 2.
        let alertController = UIAlertController(
            title: "New Set",
            message: "Create your set",
            preferredStyle: .alert) 
        
        // 3.
        let addAction = UIAlertAction(
            title: "Add", style: .default) {_ in
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {return}
                self.show(vc, sender: nil)
                
                guard let name = setName?.text, let time = setSec?.text, let rest = restSec?.text else { return }
                
                Sets.sets.append(SetList(setName: name, setTime: time, restTime: rest))
               
            }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 4.
        alertController.addTextField {
            (txtSetname) -> Void in
            setName = txtSetname
            txtSetname.text = self.setList?.setName
            
        }
        
        alertController.addTextField {
            (txtSetSec) -> Void in
            setSec = txtSetSec
            txtSetSec.text = self.setList?.setTime
            setSec?.placeholder = "<set time>"
        }
        alertController.addTextField {
            (txtRestSec) -> Void in
            restSec = txtRestSec
            txtRestSec.text = self.setList?.restTime
            restSec?.placeholder = "<rest time>"
        }
        
        // 5.
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
}
