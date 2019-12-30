//
//  RestaurantDetail.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 30/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import Foundation
import UIKit

class RestaurantDetail : UIViewController{

    var image = UIImage()

    var mainRestaurantName = String()

    @IBOutlet var background: UIImageView!

    @IBOutlet var mainImageView: UIImageView!

    @IBOutlet var restName: UILabel!

    override func viewDidLoad() {

        restName.text = mainRestaurantName
        background.image = image
        mainImageView.image = image
        
    }
}
