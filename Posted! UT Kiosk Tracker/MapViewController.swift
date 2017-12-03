//
//  PosterViewController.swift
//  Posted! UT Kiosk Tracker
//
//  Created by Chia Hua on 12/2/17.
//  Copyright © 2017 Chia Hua. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var Map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        self.Map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do anys additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        var location = CLLocationCoordinate2DMake(30.285967, -97.736179)
        var span = MKCoordinateSpanMake(0.013, 0.013)
        var region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated:false)
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "camera location"
        annotation.subtitle = "Default focus"
        
        //Map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

