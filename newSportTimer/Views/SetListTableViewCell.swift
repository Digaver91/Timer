//
//  SetListTableViewCell.swift
//  newSportTimer
//
//  Created by Dmytro Gavrylov on 30.09.2022.
//

import UIKit

class SetListTableViewCell: UITableViewCell {
    
    var set: SetList? {
        didSet {
            setTimeLabel.text = set?.setTime
            setNameLabel.text = set?.setName
            restTimeLabel.text = set?.restTime
        }
    }
    
    @IBOutlet weak var setNameLabel: UILabel!
    
    @IBOutlet weak var setTimeLabel: UILabel!
    
    @IBOutlet weak var restTimeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
