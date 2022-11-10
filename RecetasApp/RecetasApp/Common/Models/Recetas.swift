//
//  Recetas.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import Foundation

// MARK: - Welcome
struct Recetas: Decodable {
    var recetas: [Receta]?
}

// MARK: - Receta
struct Receta: Decodable {
    let id: Int?
    let imagen: String?
    let nombre, descripcion: String?
    let latitude, longitude: Double?
}

extension Receta: RecetasViewItemInterface {
    var imageURL: URL? {
        return URL(string: imagen ?? "")
    }

    var title: String? {
        return nombre
    }
    
    var description: String? {
        return descripcion
    }
    
    var lat: Double? {
        return latitude
    }
    
    var long: Double? {
        return longitude
    }
}
