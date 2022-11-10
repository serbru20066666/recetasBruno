//
//  DetailRecetaWireframe.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  Copyright (c) . All rights reserved.
//
// 
//

import UIKit

final class DetailRecetaWireframe: BaseWireframe {

    // MARK: - Module setup -

    init(receta: Receta) {
        let moduleViewController = DetailRecetaViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = DetailRecetaInteractor()
        let presenter = DetailRecetaPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        presenter.receta = receta
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DetailRecetaWireframe: DetailRecetaWireframeInterface {
    
    func navigate(to option: ListaRecetasNavigationOption) {
        switch option {
        case .details(let receta):
            _openDetails(with: receta)
            
        }
    }
    
    private func _openDetails(with receta: Receta) {
        navigationController?.pushWireframe(PlaceWireframe(lat: receta.latitude ?? 0.0, long: receta.longitude ?? 0.0))
    }
}
