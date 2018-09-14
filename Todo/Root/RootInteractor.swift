//
//  RootInteractor.swift
//  Todo
//
//  Created by Marquez on 14/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func routeToLoggedIn(nickName: String) -> LoggedInActionableItem
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener, RootActionableItem, URLHandler {

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
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
    
    // MARK: - LoggedOutListener
    
    func didLogin(nickName: String) {
        let loggedInActionableItem = router?.routeToLoggedIn(nickName: nickName)
        if let loggedInActionableItem = loggedInActionableItem {
            loggedInActionableItemSubject.onNext(loggedInActionableItem)
        }
    }
    
    // MARK: - UrlHandler
    
    func handle(_ url: URL) {

    }
    
    // MARK: - RootActionableItem
    
    func waitForLogin() -> Observable<(LoggedInActionableItem, ())> {
        return loggedInActionableItemSubject
            .map { (loggedInItem: LoggedInActionableItem) -> (LoggedInActionableItem, ()) in
                (loggedInItem, ())
        }
    }
    
    // MARK: - Private
    
    private let loggedInActionableItemSubject = ReplaySubject<LoggedInActionableItem>.create(bufferSize: 1)
}
