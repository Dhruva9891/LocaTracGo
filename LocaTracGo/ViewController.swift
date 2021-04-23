//
//  ViewController.swift
//  LocaTracGo
//
//  Created by Dhruva Beti on 23/04/21.
//

import UIKit
import MapKit
import GooglePlaces
import GoogleMaps

class ViewController: UIViewController {    
    
    @IBOutlet weak var mapView: GMSMapView!
//      @IBOutlet weak var mapView: MKMapView!
    
    
    var resultsViewController:GMSAutocompleteResultsViewController?
    var searchController:UISearchController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSearchController()
        resultsViewController?.delegate = self
    }
    
    func setupSearchController() {
        resultsViewController = GMSAutocompleteResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    
}

extension ViewController:GMSAutocompleteResultsViewControllerDelegate{
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        //        // 1
        //        searchController?.isActive = false
        //
        //        // 2
        //        mapView.removeAnnotations(mapView.annotations)
        //
        //        // 3
        //        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        //        mapView.setRegion(region, animated: true)
        //
        //        // 4
        //        let annotation = MKPointAnnotation()
        //        annotation.coordinate = place.coordinate
        //        annotation.title = place.name
        //        annotation.subtitle = place.formattedAddress
        //        mapView.addAnnotation(annotation)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}
