//
//  Todo.swift
//  Todo
//
//  Created by Marquez on 14/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var itemId: String = UUID().uuidString
    @objc dynamic var body: String = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var timestamp: Date = Date()
    
    override static func primaryKey() -> String? {
        return "itemId"
    }
}
