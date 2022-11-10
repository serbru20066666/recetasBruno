//
//  DetailRecetaInterfaces.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  Copyright (c) . All rights reserved.
//
// 
//

import UIKit

protocol DetailRecetaWireframeInterface: WireframeInterface {
    func navigate(to option: ListaRecetasNavigationOption)
}

protocol DetailRecetaViewInterface: ViewInterface {
    func reloadData()
}

protocol DetailRecetaPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> RecetasViewItemInterface?
    func goToMap()
    
}

protocol DetailRecetaInteractorInterface: InteractorInterface {
}
