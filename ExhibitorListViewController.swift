//
//  ExhibitorListViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 21/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class ExhibitorListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {



    @IBOutlet var tableView: UITableView!
    //Connect the tableView in the storyboard to this controller class to define its variable.

    var names = ["AStyle","WinDoor","Pop","Metal","Designer"]
    var boothNos = ["102","115","119","126","131"]
    var images = [UIImage(named: "Clogo1"),UIImage(named: "Clogo2"),UIImage(named: "Clogo3"),UIImage(named: "Clogo4"),UIImage(named: "Clogo5")]

    /* Define properties for the table view.
        //These images are uploaded to Assets.xcassets file.
        //In assignment 2, these data will be designed to download from remote data.
     */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return names.count

    }

    //Define the number of rows in the tableView. It will increase when more rows are needed.

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as!
        CustomCell


        cell.photo.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        cell.boothNo.text = boothNos[indexPath.row]

        return cell
    }
    //This function is to load the array data to each cell in the table view.

}
