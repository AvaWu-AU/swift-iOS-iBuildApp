//
//  SendProductsViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 30/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

/*
 👉This view controller class is for the implementation of
 the Delegation Design Pattern of assignment 2.
 */

import UIKit

protocol DataSentDelegate{

    func userDidEnterData(data: String)
}

class SendProductsViewController: UIViewController {

    @IBOutlet weak var dataEntryTextField: UITextField!

    var delegate: DataSentDelegate? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func sendBtnWasPressed(_ sender: Any) {

        if delegate != nil {
            if dataEntryTextField.text != nil{
                let data = dataEntryTextField.text
                delegate?.userDidEnterData(data: data!)

                //After press the 'Send' button, the screen should dismiss.
                dismiss(animated: true, completion:nil)

            }

        }

    }




}
