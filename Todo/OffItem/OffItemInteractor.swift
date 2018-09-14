//
//  OffItemInteractor.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift

protocol OffItemRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol OffItemPresentable: Presentable {
    var listener: OffItemPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol OffItemListener: class {
    func startItem(with itemBuilder: ItemBuildable)
}

final class OffItemInteractor: PresentableInteractor<OffItemPresentable>, OffItemInteractable, OffItemPresentableListener {

    weak var router: OffItemRouting?
    weak var listener: OffItemListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: OffItemPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func start(_ item: Item) {
        listener?.startItem(with: item.builder)
    }
}
