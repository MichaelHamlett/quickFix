//
//  PostTableViewCell.swift
//  quickFix
//
//  Created by Michael Hamlett, Akshay Trikha, Pratyush Kapur on 10/28/17.
//  Copyright © 2017 Michael Hamlett, Akshay Trikha, Pratyush Kapur, Shiv Seetharaman, Maxwell Maleno. All rights reserved.


import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var modObj: AudioModel!{
        didSet{
            //messageLabel.text = modObj.text
            //timeLabel.text = "000"
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
