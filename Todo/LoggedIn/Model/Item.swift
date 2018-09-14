//
//  Item.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs

public protocol ItemListener: class {
//    func itemDidEnd(with winner: PlayerType?)
}

public protocol ItemBuildable: Buildable {
    func build(withListener listener: ItemListener) -> ViewableRouting
}

public protocol Item {
    var id: String { get }
    var name: String { get }
    var builder: ItemBuildable { get }
}

