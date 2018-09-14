//
//  OffItemViewController.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol OffItemPresentableListener: class {
    func start(_ item: Item)
}

final class OffItemViewController: UIViewController, OffItemPresentable, OffItemViewControllable {

    weak var listener: OffItemPresentableListener?
    
    init(items: [Item]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
    }
    
    // MARK: - Private
    
    private let items: [Item]
}
