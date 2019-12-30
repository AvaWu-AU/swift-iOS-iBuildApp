//
//  MyVisitCollectionViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 20/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyVisitCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell

        return cell
    }


}
