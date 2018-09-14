//
//  TodoViewController.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TodoPresentableListener: class {
    
}

final class TodoViewController: UIViewController, TodoPresentable, TodoViewControllable {

    weak var listener: TodoPresentableListener?
    
    init(nickName: String) {
        self.nickName = nickName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
//        buildCollectionView()
    }
    
    // MARK: - Private
    
    private let nickName: String
}
