//
//  LoggedInInteractor.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToOffItem(with items: [Item])
    func routeToItem(with itemBuilder: ItemBuildable)
}

protocol LoggedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable, LoggedInActionableItem {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    init(items: [Item]) {
        self.items = items
        super.init()
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.routeToOffItem(with: items)
    }
    
    override func willResignActive() {
        super.willResignActive()
        
        router?.cleanupViews()
    }
    
    // MARK: - OffGameListener
    
    func startItem(with itemBuilder: ItemBuildable) {
        router?.routeToItem(with: itemBuilder)
    }
    
    // MARK: - TicTacToeListener
    
//    func gameDidEnd(with winner: PlayerType?) {
//        router?.routeToOffGame(with: games)
//    }
    
    // MARK: - LoggedInActionableItem
    
    func launchItem(with id: String?) -> Observable<(LoggedInActionableItem, ())> {
        let item: Item? = items.first { item in
            return true
        }
        
        if let item = item {
            router?.routeToItem(with: item.builder)
        }
        
        return Observable.just((self, ()))
    }
    
    // MARK: - Private
    
    private var items = [Item]()

}
