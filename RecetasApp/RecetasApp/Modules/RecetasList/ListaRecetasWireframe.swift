//
//  ListaRecetasWireframe.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  .
//
//  
//

import UIKit

final class ListaRecetasWireframe: BaseWireframe {

    // MARK: - Module setup -

    init() {
        let moduleViewController = ListaRecetasViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = ListaRecetasInteractor()
        let presenter = ListaRecetasPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ListaRecetasWireframe: ListaRecetasWireframeInterface {
    
    func navigate(to option: ListaRecetasNavigationOption) {
        switch option {
        case .details(let receta):
            _openDetails(with: receta)
        }
    }
    
    private func _openDetails(with receta: Receta) {
        navigationController?.pushWireframe(DetailRecetaWireframe(receta: receta))
    }
    
}
