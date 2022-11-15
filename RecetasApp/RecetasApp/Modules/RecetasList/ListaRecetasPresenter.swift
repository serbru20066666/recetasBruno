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
                    ($0.nombre ?? "").lowercased().contains(searchText.lowercased())
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
        let _ = interactor.getRecetas { [weak self] (response) -> (Void) in
            if let list =  response {
                self?.items = list
                self?.itemsBackup = list
            } else {
                self?.wireframe.showErrorAlert(with: "DATA ERROR")
            }
            self?.view.setLoadingVisible(false)
        }
    }
}

