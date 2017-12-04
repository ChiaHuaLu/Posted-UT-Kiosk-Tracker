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
        
        var allKiosks = initializeKiosks()
        for index in 0...18 {
            var kiosk = allKiosks[index]
            var kioskAnnotation = MKPointAnnotation()
            var kioskLocation = CLLocationCoordinate2DMake(kiosk.latitude, kiosk.longitude)
            kioskAnnotation.coordinate = kioskLocation
            kioskAnnotation.title = kiosk.name
            kioskAnnotation.subtitle = "Posters:\(kiosk.posterCount)"
            Map.addAnnotation(kioskAnnotation)
        }
        
        //Map.addAnnotation(annotation)
        
    }
    
    func initializeKiosks() -> [Kiosk] {
        var kioskNames: [String] = ["Kinsolving",     "SSB",     "RLM","Hearst Student Media", "Burdine",     "Bio", "Welch-Painter", "Guadalupe",     "FAC",   "Tower", "Waggner", "Winship", "Art Building",     "GSB", "Littlefield Fountain",     "PCL", "Gregory", "RecSports Center", "School of Music"]
        var latitude: [Double] = [    30.289897,  30.289754, 30.289301,              30.288817, 30.288587, 30.287434,       30.287372,   30.285797, 30.285912, 30.285683, 30.285526, 30.285587,      30.285494, 30.284337,              30.283790, 30.283373, 30.283512,          30.281537,         30.286861]
        var longitude: [Double] = [  -97.740086, -97.738839,-97.736685,             -97.740447,-97.738902,-97.740334,      -97.738315,  -97.741550,-97.740682,-97.739996,-97.737911,-97.734405,     -97.733426,-97.738590,             -97.739375,-97.737711,-97.737189,         -97.733091,        -97.730413]
        var allKiosks: [Kiosk] = []
        for index in 0...18 {
            allKiosks.append(Kiosk.init(kioskName: kioskNames[index], latitude: latitude[index], longitude: longitude[index]))
        }
        return allKiosks
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

