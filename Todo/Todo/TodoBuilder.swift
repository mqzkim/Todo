//
//  TodoBuilder.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

protocol TodoDependency: Dependency {
    var nickName: String { get }
}

final class TodoComponent: Component<TodoDependency> {
    fileprivate var nickName: String {
        return dependency.nickName
    }
}

// MARK: - Builder

protocol TodoBuildable: Buildable {
    func build(withListener listener: TodoListener) -> TodoRouting
}

final class TodoBuilder: Builder<TodoDependency>, TodoBuildable {

    override init(dependency: TodoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TodoListener) -> TodoRouting {
        let component = TodoComponent(dependency: dependency)
        let viewController = TodoViewController(nickName: component.nickName)
        let interactor = TodoInteractor(presenter: viewController)
        interactor.listener = listener
        return TodoRouter(interactor: interactor, viewController: viewController)
    }
}
