//
//  AddressBook.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/10/22.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import Foundation
import CoreData

class Address: NSManagedObject {

    @NSManaged var city: String
    @NSManaged var other: String
    @NSManaged var state: String
    @NSManaged var zipCode: String
    @NSManaged var people: NSSet

}
