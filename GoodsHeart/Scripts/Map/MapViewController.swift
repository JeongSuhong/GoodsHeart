

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController : UIViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationText: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.requestLocation()
        
        mapView.showsUserLocation = true
        self.mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geocoder.reverseGeocodeLocation(center, preferredLocale: locale, completionHandler: {(placemarks, error) -> Void in if error != nil {
            NSLog("\(error)")
            return
            }
            guard let placemark = placemarks?.first,
                let addrList = placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
                    return
            }
            let address = addrList.joined(separator: " ")
            self.locationText.text = address
        })
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {

    }
    
    @IBAction func clickSuccess(_ sender: UIButton) {
    }
    
}
    
extension MapViewController : CLLocationManagerDelegate
    {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            let location = CLLocation(latitude: 33.450701, longitude: 126.570667)

            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        print("!!")
            let location = locations.last! as CLLocation

            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
}
