//
//  LoggedInBuilder.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }
    
    fileprivate var items: [Item] {
        return shared {
            return [TodoAdapter(dependency: self)]
        }
    }
    
    let nickName: String
    init(dependency: LoggedInDependency, nickName: String) {
        self.nickName = nickName
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener, nickName: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem)
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, nickName: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem) {
        let component = LoggedInComponent(dependency: dependency,
                                          nickName: nickName)
        let interactor = LoggedInInteractor(items: component.items)
        interactor.listener = listener
        
        let offItemBuilder = OffItemBuilder(dependency: component)
        let router = LoggedInRouter(interactor: interactor,
                                    viewController: component.loggedInViewController,
                                    offItemBuilder: offItemBuilder)
        return (router, interactor)
    }
}
