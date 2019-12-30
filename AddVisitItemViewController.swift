//
//  AddVisitItemViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 29/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit

class AddVisitItemViewController: UIViewController {


    @IBOutlet var textField: UITextField!

    @IBOutlet var isImp: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnTapped(_ sender: Any) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let task = Task(context:context)
        task.name = textField.text!
        task.isImportant = isImp.isOn

        //Save the data to coredata

        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        navigationController!.popViewController(animated: true)



    }




}
