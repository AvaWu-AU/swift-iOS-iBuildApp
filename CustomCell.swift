//
//  CustomExhibitorTableViewCell.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 21/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var boothNo: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var photo: UIImageView!

    //Connect the tableView cell in the storyboard to this controller class to define its variables.


    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
