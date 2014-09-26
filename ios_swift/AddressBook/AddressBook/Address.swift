//
//  Address.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/08/11.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import Foundation
import CoreData

class Address: NSManagedObject {

    @NSManaged var zipCode: String
    @NSManaged var state: String
    @NSManaged var city: String
    @NSManaged var other: String
    @NSManaged var person: Person

}
