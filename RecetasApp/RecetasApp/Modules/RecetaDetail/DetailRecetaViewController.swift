//
//  DetailRecetaViewController.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  Copyright (c) . All rights reserved.
//
//
//

import UIKit

final class DetailRecetaViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailRecetaPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
	
    func registerCells(){
        tableView.register(UINib(nibName: Constants.Cells.recetaInfoCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.recetaInfoCell)
    }
}

// MARK: - Extensions -

extension DetailRecetaViewController: DetailRecetaViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
}


extension DetailRecetaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.recetaInfoCell, for: indexPath) as! recetaInfoCell
        cell.delegate = self
        let item = presenter.item(at: indexPath)
        if let itemCell = item {
            cell.configure(with: itemCell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension DetailRecetaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DetailRecetaViewController: recetaInfoCellProtocol {
    func showMapWithReceta(receta: RecetasViewItemInterface) {
        self.presenter.goToMap()
    }
    
    
}
