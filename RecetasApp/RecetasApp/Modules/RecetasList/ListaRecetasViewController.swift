//
//  ListaRecetasViewController.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  .
//
//  
//

import UIKit

final class ListaRecetasViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var searchBart: UISearchBar!
    @IBOutlet weak var ttitleBar: UINavigationItem!
    var presenter: ListaRecetasPresenterInterface!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        presenter.viewDidLoad()
        self.ttitleBar.title = "Lista de recetas Yape"
    }
    
    func registerCells(){
        tableView.register(UINib(nibName: Constants.Cells.recetaCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.recetaCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
	
}

// MARK: - Extensions -

extension ListaRecetasViewController: ListaRecetasViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
    
    func setLoadingVisible(_ visible: Bool) {
        if visible {
            ProgressHUD.showProgress(0.42)
        } else {
            ProgressHUD.dismiss()
        }
    }

}

extension ListaRecetasViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.recetaCell, for: indexPath) as! RecetaCell
        let item = presenter.item(at: indexPath)
        if let itemCell = item {
            cell.configure(with: itemCell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ListaRecetasViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
}

extension ListaRecetasViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterRecetas(searchText: searchText)
       }
    
    
}
