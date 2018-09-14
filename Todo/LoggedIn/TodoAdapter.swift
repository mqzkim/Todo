//
//  TodoAdapter.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

class TodoAdapter: Item, ItemBuildable, TodoListener {
    let id = "todo"
    let name = "Todo"
    let todoBuilder: TodoBuilder
    var builder: ItemBuildable {
        return self
    }
    
    weak var itemListener: ItemListener?
    
    init(dependency: TodoDependency) {
        todoBuilder = TodoBuilder(dependency: dependency)
    }
    
    func build(withListener listener: ItemListener) -> ViewableRouting {
        itemListener = listener
        return todoBuilder.build(withListener: self)
    }
}
