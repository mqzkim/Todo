//
//  OffItemRouter.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

protocol OffItemInteractable: Interactable {
    var router: OffItemRouting? { get set }
    var listener: OffItemListener? { get set }
}

protocol OffItemViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class OffItemRouter: ViewableRouter<OffItemInteractable, OffItemViewControllable>, OffItemRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: OffItemInteractable, viewController: OffItemViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
