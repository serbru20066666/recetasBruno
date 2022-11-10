//
//  PlaceInterfaces.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//
//
//
//

import UIKit

protocol PlaceWireframeInterface: WireframeInterface {
}

protocol PlaceViewInterface: ViewInterface {
    func setMapCoord(lat:Double,long:Double)
}

protocol PlacePresenterInterface: PresenterInterface {
}
