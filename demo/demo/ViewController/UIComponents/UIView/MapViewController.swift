//
//  MapViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 29/03/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!

    let locationManager = CLLocationManager()
    var places: [MKAnnotation] = []
    var route: MKRoute?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        map.delegate = self
        configure()
    }

    @IBAction func getDirections(_ sender: Any) {
        
        var textField = UITextField()
    
        if let route = route {
            map.removeOverlay(route.polyline)
        }
        
        let alert = UIAlertController(title: "Get directions", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let search = UIAlertAction(title: "Search", style: .default) { [weak self] (search) in
            if textField.text == "home" {
                self?.getRoute(destination: MKMapItem(placemark: MKPlacemark(coordinate: (self?.places[1].coordinate)!)))
            } else if textField.text == "simform" {
                self?.getRoute(destination: MKMapItem(placemark: MKPlacemark(coordinate: (self?.places[0].coordinate)!)))
            }
        }

        alert.addTextField  { (text) in
            textField = text
            textField.placeholder = "Enter destination"
        }
            
        alert.addAction(cancel)
        alert.addAction(search)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func showUser(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }

    func configure() {

        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.showsUserLocation = true
        
        //for satellite view
        //map.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: .realistic)

        let simform = MKPointAnnotation()
        simform.coordinate = CLLocationCoordinate2DMake(23.02818331024883, 72.4995136032609)
        simform.title = "Simform Solutions"
        places.append(simform)

        let home = MKPointAnnotation()
        home.coordinate = CLLocationCoordinate2DMake(23.023188, 72.546977)
        home.title = "Home"
        places.append(home)

        map.addAnnotations(places)
    }

    func getRoute(destination: MKMapItem) {
        
        let directionRequest = MKDirections.Request()
        guard let currentLocationCoordinates = locationManager.location?.coordinate
        else { return }
        
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocationCoordinates))
        directionRequest.destination = destination
        directionRequest.requestsAlternateRoutes = true
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate{ [weak self] (response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let response = response {
                self?.route = response.routes[0]
                self?.map.addOverlay(response.routes[0].polyline)
                self?.map.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
            }
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let currentCoordinate = manager.location?.coordinate
        else { return }
        let region = MKCoordinateRegion(center: currentCoordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        map.setRegion(region, animated: true)
        manager.stopUpdatingLocation()
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        guard let currentRoute = route else { return MKOverlayRenderer() }
        
        let renderedPolyLine = MKPolylineRenderer(polyline: currentRoute.polyline)
        renderedPolyLine.strokeColor = .blue
        renderedPolyLine.lineWidth = 5
        
        return renderedPolyLine
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation is MKUserLocation {
            return nil
        }

        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "Annotation")

        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
        annotationView?.canShowCallout = true

        if annotation.title == "Simform Solutions" {
            annotationView?.image = UIImage(systemName: "building.fill")
        } else if annotation.title == "Home" {
            annotationView?.image = UIImage(systemName: "house.fill")
        }

        return annotationView
    }
}
