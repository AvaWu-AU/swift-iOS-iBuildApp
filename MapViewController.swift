//
//  MapViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 25/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    //Connect the map view in the storyboard to this controller class
    @IBOutlet var map: MKMapView!

    let manager = CLLocationManager()

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]

        let span: MKCoordinateSpan  = MKCoordinateSpanMake(11,151)

        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)

        print(location.speed)


        self.map.showsUserLocation = true


    }


    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
