//
//  Address.swift
//  Archive2
//
//  Created by taisuke fujita on 2014/07/10.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class Address: NSObject, NSCoding {
    // 郵便番号
    let zipCode: String
    // 都道府県
    let state: String
    // 区市町村
    let city: String
    // その他
    let other: String
    // コンストラクタ
    init(zipCode: String, state: String, city: String, other: String) {
        self.zipCode = zipCode
        self.state = state
        self.city = city
        self.other = other
    }
    // 復元用コンストラクタ
    required init(coder aDecoder: NSCoder) {
        self.zipCode = aDecoder.decodeObjectForKey("zipCode") as String
        self.state = aDecoder.decodeObjectForKey("state") as String
        self.city = aDecoder.decodeObjectForKey("city") as String
        self.other = aDecoder.decodeObjectForKey("other") as String
    }
    // エンコード
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.zipCode, forKey:"zipCode")
        aCoder.encodeObject(self.state, forKey:"state")
        aCoder.encodeObject(self.city, forKey:"city")
        aCoder.encodeObject(self.other, forKey:"other")
    }
}
