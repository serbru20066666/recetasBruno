//
//  PlaceWireframe.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  
//
// 
//

import UIKit

final class PlaceWireframe: BaseWireframe {

    // MARK: - Module setup -

    init(lat:Double, long:Double) {
        let moduleViewController = PlaceViewController()
        super.init(viewController: moduleViewController)
        
        let presenter = PlacePresenter(view: moduleViewController, wireframe: self)
        presenter.latitude = lat
        presenter.longitude = long
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension PlaceWireframe: PlaceWireframeInterface {

}
