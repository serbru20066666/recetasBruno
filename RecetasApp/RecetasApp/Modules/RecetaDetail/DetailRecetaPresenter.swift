//
//  DetailRecetaPresenter.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  Copyright (c) . All rights reserved.
//
// 
//

import UIKit

final class DetailRecetaPresenter {

    // MARK: - Private properties -

    private unowned let view: DetailRecetaViewInterface
    private let interactor: DetailRecetaInteractorInterface
    private let wireframe: DetailRecetaWireframeInterface

    // MARK: - Lifecycle -

    var receta: Receta?
    
    init(view: DetailRecetaViewInterface, interactor: DetailRecetaInteractorInterface, wireframe: DetailRecetaWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension DetailRecetaPresenter: DetailRecetaPresenterInterface {
    func goToMap() {
        guard let receta = self.receta else {return}
        wireframe.navigate(to: .details(receta))
    }
    
    func item(at indexPath: IndexPath) -> RecetasViewItemInterface? {
        return self.receta }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return 1
    }
    
    
    func viewDidLoad() {
        self.view.reloadData()
    }
    
}
