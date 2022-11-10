//
//  ListaRecetasInteractor.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  .
//
//
//

import Foundation
import Alamofire

final class ListaRecetasInteractor {
    fileprivate let _recetasService = RecetasService()
}

// MARK: - Extensions -

extension ListaRecetasInteractor: ListaRecetasInteractorInterface {
    func getRecetas(_ completion: @escaping RecetasListCompletionBlock) -> DataRequest {
        return _recetasService.getRecetas(completion)
    }
}
