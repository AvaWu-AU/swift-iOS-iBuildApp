//
//  ExDetailCollectionViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 1/02/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ExhibitorDetailCollectionViewController: UICollectionViewController {

    //,UICollectionViewDataSource,UICollectionViewDelegate

    var imagesArray = [String]()

    var exhibitorDetailModel = ExhibitorDetailModel(imagesName:["Clogo1","Clogo2","Clogo3","Clogo4","Clogo5"])


    override func viewDidLoad() {
        super.viewDidLoad()

      imagesArray = exhibitorDetailModel.imagesName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath)


    let textView = cell.viewWithTag(7) as! UITextView

    let imageView = cell.viewWithTag(6) as! UIImageView

    textView.isScrollEnabled = false

    imageView.image = UIImage(named: imagesArray[indexPath.row])

    let backBtn = cell.viewWithTag(8) as! UIButton

    backBtn.isHidden = true

    return cell


    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{

    return exhibitorDetailModel.imagesName.count

    }


    //Advanced Feature of Animation
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath)

        cell?.superview?.bringSubview(toFront: cell!)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: ({


            cell?.frame = collectionView.bounds

            collectionView.isScrollEnabled = false

            let backBtn = cell!.viewWithTag(8) as! UIButton

            backBtn.isHidden = false

            backBtn.addTarget(self, action: #selector(ExhibitorDetailCollectionViewController.backBtnAction), for: UIControlEvents.touchUpInside)


            let textView = cell!.viewWithTag(7) as! UITextView

            textView.isScrollEnabled = false


        }), completion: nil)


    }

    func backBtnAction(){

        let indexPath = collectionView?.indexPathsForSelectedItems
        collectionView?.isScrollEnabled = true
        collectionView?.reloadItems(at: indexPath!)
    }


}
