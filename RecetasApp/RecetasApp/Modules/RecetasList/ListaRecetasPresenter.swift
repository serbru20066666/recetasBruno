//
//  ListaRecetasPresenter.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  .
//
//  
//

import UIKit
import Alamofire

final class ListaRecetasPresenter {

    // MARK: - Private properties -

    private unowned let view: ListaRecetasViewInterface
    private let interactor: ListaRecetasInteractorInterface
    private let wireframe: ListaRecetasWireframeInterface
    var filteredData:[Receta]!
    private var items: Recetas? {
        didSet {
            view.reloadData()
        }
    }
    private var itemsBackup: Recetas?

    // MARK: - Lifecycle -

    init(view: ListaRecetasViewInterface, interactor: ListaRecetasInteractorInterface, wireframe: ListaRecetasWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ListaRecetasPresenter: ListaRecetasPresenterInterface {
    func filterRecetas(searchText:String) {
        if searchText.isEmpty {
            self.items = self.itemsBackup
        } else {
            if let recetas = items?.recetas {
                filteredData = searchText.isEmpty ? recetas : recetas.filter {
                    $0.nombre!.contains(searchText.lowercased())
                }
                if filteredData.count == 0 {
                    self.items = self.itemsBackup
                } else {
                    self.items?.recetas = filteredData
                }
            } else
            {
                self.items = self.itemsBackup
            }
        }
        view.reloadData()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        if let items = items?.recetas { return items.count} else {return 0}
    }
    
    func item(at indexPath: IndexPath) -> RecetasViewItemInterface? {
        guard let receta = items?.recetas?[indexPath.row] else {return nil}
        return receta
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let receta = items?.recetas?[indexPath.row] else {return}
        wireframe.navigate(to: .details(receta))
    }
    
    
    func viewDidLoad() {
        self.view.setLoadingVisible(true)
        interactor.getRecetas { [weak self] (response) -> (Void) in
            self?.view.setLoadingVisible(false)
            self?._handleRecetasListResult(response.result)
        }
    }
    
    // MARK: Utility
    
    private func _handleRecetasListResult(_ result: Result<Recetas>) {
        switch result {
        case .success(let jsonObject):
            items = jsonObject
            itemsBackup = items
        case .failure(let error):
            wireframe.showErrorAlert(with: error.message)
        }
    }
}
