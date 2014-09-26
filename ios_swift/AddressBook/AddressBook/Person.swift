//
//  Person.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/08/11.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var address: Address

}
