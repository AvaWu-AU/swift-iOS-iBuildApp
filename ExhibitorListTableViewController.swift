//
//  ExhibitorListTableViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 20/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

struct cellData{

    let cell : Int!
    let textName : String!
    let textNo : String!
    let image : UIImage!

}

class ExhibitorListTableViewController: UITableViewController {

    var arrayOfCellData = [cellData]()

    override func viewDidLoad() {
        arrayOfCellData  = [cellData(cell : 1, textName : "ABC Co", textNo : "115",    image : #imageLiteral(resourceName: "Clogo1")),
                            cellData(cell : 1, textName : "Windoor", textNo : "126", image : #imageLiteral(resourceName: "Clogo2")),
                            cellData(cell : 1, textName : "Trade Air Co", textNo : "108", image : #imageLiteral(resourceName: "Clogo3")),
                            cellData(cell : 1, textName : "Better Building", textNo : "117", image : #imageLiteral(resourceName: "Clogo4")),
                            cellData(cell : 1, textName : "Building Tool", textNo : "131", image : #imageLiteral(resourceName: "Clogo5"))]
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayOfCellData.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = Bundle.main.loadNibNamed("ExhibitorTableViewCell", owner: self, options: nil)?.first as! ExhibitorTableViewCell

        cell.mainImageView.image = arrayOfCellData[indexPath.row].image
        cell.mainLable1.text = arrayOfCellData[indexPath.row].textName
        cell.mainLable2.text = arrayOfCellData[indexPath.row].textNo

        return cell


    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 67

    }



}
