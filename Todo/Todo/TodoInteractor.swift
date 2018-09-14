//
//  TodoInteractor.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift

protocol TodoRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TodoPresentable: Presentable {
    var listener: TodoPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TodoListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TodoInteractor: PresentableInteractor<TodoPresentable>, TodoInteractable, TodoPresentableListener {

    weak var router: TodoRouting?
    weak var listener: TodoListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TodoPresentable) {
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
}
