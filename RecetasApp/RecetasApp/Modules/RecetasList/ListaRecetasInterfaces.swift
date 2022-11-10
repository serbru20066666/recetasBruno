//
//  ListaRecetasInterfaces.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  .
//
//  
//

import UIKit
import Alamofire


enum ListaRecetasNavigationOption {
    case details(Receta)
}

protocol ListaRecetasWireframeInterface: WireframeInterface {
    func navigate(to option: ListaRecetasNavigationOption)
}

protocol ListaRecetasViewInterface: ViewInterface {
    func reloadData()
    func setLoadingVisible(_ visible: Bool)
}

protocol ListaRecetasPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> RecetasViewItemInterface?
    func filterRecetas(searchText:String)
    func didSelectItem(at indexPath: IndexPath)
}

protocol ListaRecetasInteractorInterface: InteractorInterface {
    func getRecetas(_ completion: @escaping RecetasListCompletionBlock) -> DataRequest
}
protocol RecetasViewItemInterface {
    var title: String? { get }
    var imageURL: URL? { get }
    var description: String? { get }
}
