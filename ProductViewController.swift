//
//  ProductViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 22/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, DataSentDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    var productModel = ProductModel(logoImageName: "iBuildLogo",productName: ["Product1","Product2","Product3","Product4"])

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet weak var receivingLabel: UILabel!

    var images:[String] = []

   /* required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Add advanced feature of Animation when the screen load

        let imageView = logoImage

        let image = UIImage(named: productModel.logoImageName)

        imageView?.image = image

        self.view.addSubview(imageView!)

        let animation = CATransition()

        animation.duration = 2

        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        animation.type = kCATransitionPush

        imageView?.layer.add(animation, forKey: "Push")

        // Do any additional setup after loading the view.
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images = productModel.productName
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell{

        images = productModel.productName

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        let imageView = cell.viewWithTag(1000) as! UIImageView

        imageView.image = UIImage(named: images[indexPath.item])

        return cell

    }

    //Methods below are for receiving data via the design pattern of delegation

    func userDidEnterData(data: String) {
        receivingLabel.text = data
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showSendingPro"{

            let sendingPro: SendProductsViewController = segue.destination as! SendProductsViewController
            sendingPro.delegate = self

        }

    }

}
