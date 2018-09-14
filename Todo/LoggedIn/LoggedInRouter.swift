//
//  LoggedInRouter.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, ItemListener, OffItemListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         offItemBuilder: OffItemBuildable) {
        self.viewController = viewController
        self.offItemBuilder = offItemBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    // MARK: - LoggedInRouting
    
    func cleanupViews() {
        if currentChild != nil {
            viewController.replaceModal(viewController: nil)
        }
    }
    
    func routeToOffItem(with items: [Item]) {
        detachCurrentChild()
        attachOffItem(with: items)
    }
    
    func routeToItem(with itemBuilder: ItemBuildable) {
        detachCurrentChild()
        
        let item = itemBuilder.build(withListener: interactor)
        self.currentChild = item
        attachChild(item)
        viewController.replaceModal(viewController: item.viewControllable)
    }
    
    // MARK: - Private
    
    private let viewController: LoggedInViewControllable
    private let offItemBuilder: OffItemBuildable
    
    private var currentChild: ViewableRouting?
    
    private func attachOffItem(with items: [Item]) {
        let offItem = offItemBuilder.build(withListener: interactor, items: items)
        self.currentChild = offItem
        attachChild(offItem)
        viewController.replaceModal(viewController: offItem.viewControllable)
    }
    
    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.replaceModal(viewController: nil)
        }
    }
}
