//
//  RootActionableItem.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RxSwift

public protocol RootActionableItem: class {
    func waitForLogin() -> Observable<(LoggedInActionableItem, ())>
}
