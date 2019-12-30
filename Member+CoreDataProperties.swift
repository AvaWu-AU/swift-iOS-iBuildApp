//
//  Member+CoreDataProperties.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 27/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member");
    }


    @NSManaged var username: String?
    @NSManaged var companyname: String?
    @NSManaged var phone: String?
    @NSManaged var email: String?
    @NSManaged var nationality: String?
    @NSManaged var jobtitle: String?

}
