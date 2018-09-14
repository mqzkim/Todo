//
//  LoggedInComponent+Todo.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the Todo scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyTodo: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the Todo scope.
}

extension LoggedInComponent: TodoDependency {

    // TODO: Implement properties to provide for Todo scope.
}
