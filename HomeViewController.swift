//
//  HomeViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 20/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet var homeImage: UIImageView!

    var homePageModel = HomePageModel(homePageImageName: "Hall")

    override func viewDidLoad() {
        super.viewDidLoad()


        let imageView = homeImage

        let image = UIImage(named: homePageModel.homePageImageName)

        imageView?.image = image

        self.view.addSubview(imageView!)

        let animation = CATransition()

        animation.duration = 1

        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        animation.type = kCATransitionPush

        imageView?.layer.add(animation, forKey: "Push")


        // Do any additional setup after loading the view.
    }

}
