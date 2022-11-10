//
//  PlaceViewController.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//  
//
// 
//

import UIKit
import MapKit

final class PlaceViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var map: MKMapView!
    var presenter: PlacePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension PlaceViewController: PlaceViewInterface {
    func setMapCoord(lat: Double, long: Double) {
        map.centerToLocation(CLLocation(latitude: lat, longitude: long))
        let london = MKPointAnnotation()
        london.title = "Origen de la receta yape aquí"
        london.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        map.addAnnotation(london)
    }
}


