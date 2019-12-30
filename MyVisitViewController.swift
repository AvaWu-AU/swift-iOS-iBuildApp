//
//  MyVisitViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 29/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class MyVisitViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!


    //Define an array to hold the data
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {

        //get the data from coredata
        getData()

        //reload the tableview
        tableView.reloadData()
    }


    //Define the number of rows in the table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    //Fill each cell of the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()

        let task = tasks[indexPath.row]

        if task.isImportant{
            cell.textLabel?.text = "💟\(task.name!)"

        }

        else{
        cell.textLabel?.text = task.name!

        }
        return cell

    }


    func getData(){

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        do{
            tasks = try context.fetch(Task.fetchRequest())


        }
        catch {
            print("Fail to Fecth.")

        }

    }

    //Delete the data from core data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()


        do{
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch{

            print("Fail to Fecth!")
        }

    }
    tableView.reloadData()

    }

}
