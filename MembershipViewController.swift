//
//  MembershipViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 26/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit
import CoreData

class MembershipViewController: UIViewController {


    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtCompanyname: UITextField!
    @IBOutlet var txtPhone: UITextField!
    @IBOutlet var txtNationality: UITextField!
    @IBOutlet var txtJobTitle: UITextField!

    @IBAction func btnSave(){
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

        let managedObjectContext = appDelegate.managedObjectContext
        //let context:NSManagedObjectContext = appDel.managedObjectContext

        let newMember = NSEntityDescription.insertNewObject(forEntityName: "Member", into: managedObjectContext) as NSManagedObject

        newMember.setValue(txtUsername.text, forKey: "username")
        newMember.setValue(txtEmail.text, forKey: "username")
        newMember.setValue(txtCompanyname.text, forKey: "username")
        newMember.setValue(txtPhone.text, forKey: "username")
        newMember.setValue(txtNationality.text, forKey: "username")
        newMember.setValue(txtJobTitle.text, forKey: "username")


        /*newMember.setValue(txtUsername.text, forKey: "username")
        newMember.setValue(txtEmail.text, forKey: "email")
        newMember.setValue(txtCompanyname.text, forKey: "companyname")
        newMember.setValue(txtPhone.text, forKey: "phone")
        newMember.setValue(txtNationality.text, forKey: "nationality")
        newMember.setValue(txtJobTitle.text, forKey: "jobtitle")
        */
        do
        {
            try managedObjectContext.save()
            print(newMember)
            print("NewMember Saved.")
        }
        catch
        {
            print("Failed to save data.")
        }



    }

    @IBAction func btnEdit(){

        print("btnEdit")
        let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext



        let request = NSFetchRequest<Member>(entityName: "Member")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", ""+txtUsername.text!)



        do{

            let results:[AnyObject]?  = try context.fetch(request)
            //var results:[NSFetchRequestResult]?
            //let results:NSArray = context.executeFetchRequest(request)
            //results = try context.fetch(request)

        if((results?.count)! > 0){
            let res = results?[0] as! NSManagedObject


            txtUsername.text = res.value(forKey: "username") as? String
            txtEmail.text = res.value(forKey:"username") as? String
            txtCompanyname.text = res.value(forKey: "username") as? String
            txtPhone.text = res.value(forKey: "username") as? String
            txtNationality.text = res.value(forKey: "username") as? String
            txtJobTitle.text = res.value(forKey: "username") as? String


            /*txtUsername.text = res.value(forKey: "username") as? String
            txtUsername.text = res.value(forKey: "email") as? String
            txtUsername.text = res.value(forKey: "companyname") as? String
            txtUsername.text = res.value(forKey: "phone") as? String
            txtUsername.text = res.value(forKey: "nationality") as? String
            txtUsername.text = res.value(forKey: "jobtitle") as? String
 */


        }
        else{

        print("No Results Returned!")
        }

        }
        catch let error as NSError{

        print("Saved Failed: \(error)")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()



    }




}

/* test data
 John
 John@gmail.com
 ABC Co.
 123456
 AU
 Manager
 */
