//
//  PlacePresenter.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  
//
// 
//

import UIKit

final class PlacePresenter {

    // MARK: - Private properties -

    private unowned let view: PlaceViewInterface
    private let wireframe: PlaceWireframeInterface
    var latitude:Double?
    var longitude:Double?
    // MARK: - Lifecycle -

    init(view: PlaceViewInterface, wireframe: PlaceWireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension PlacePresenter: PlacePresenterInterface {
    func viewDidLoad() {
        self.view.setMapCoord(lat: self.latitude ?? 0.0, long: self.longitude ?? 0.0)
        
        
    }
}
