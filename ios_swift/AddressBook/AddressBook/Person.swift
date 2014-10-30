//
//  AddressBook.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/10/22.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var address: Address

}
