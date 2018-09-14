//
//  LoggedInComponent+Item.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the Item scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyOffItem: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the Item scope.
}

extension LoggedInComponent: OffItemDependency {

    // TODO: Implement properties to provide for Item scope.
}
