//
//  AppComponent.swift
//  Todo
//
//  Created by Marquez on 14/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
