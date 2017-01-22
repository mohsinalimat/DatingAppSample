//
//  DB_Matches+CoreDataProperties.swift
//  TrulyMadlyDemo
//
//  Created by Abhishek Thapliyal on 1/22/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import CoreData


extension DB_Matches {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Matches> {
        return NSFetchRequest<DB_Matches>(entityName: "DB_Matches");
    }

    @NSManaged public var age: Int16
    @NSManaged public var displayName: String?
    @NSManaged public var job: String?
    @NSManaged public var profileImage: String?
    @NSManaged public var userName: String?

}
