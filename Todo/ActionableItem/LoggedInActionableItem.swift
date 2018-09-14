//
//  LoggedInActionableItem.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RxSwift

public protocol LoggedInActionableItem: class {
    func launchItem(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
