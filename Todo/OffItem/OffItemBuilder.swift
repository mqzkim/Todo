//
//  OffItemBuilder.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

protocol OffItemDependency: Dependency {
    var nickName: String { get }
}

final class OffItemComponent: Component<OffItemDependency> {
    var nickName: String {
        return dependency.nickName
    }
    
}

// MARK: - Builder

protocol OffItemBuildable: Buildable {
    func build(withListener listener: OffItemListener, items: [Item]) -> OffItemRouting
}

final class OffItemBuilder: Builder<OffItemDependency>, OffItemBuildable {

    override init(dependency: OffItemDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OffItemListener, items: [Item]) -> OffItemRouting {
        let component = OffItemComponent(dependency: dependency)
        let viewController = OffItemViewController(items: items)
        let interactor = OffItemInteractor(presenter: viewController)
        interactor.listener = listener
        return OffItemRouter(interactor: interactor, viewController: viewController)
    }
}
