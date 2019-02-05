//
//  ViewController.swift
//  Flyover
//
//  Created by Nolan Fuchs on 2/4/19.
//  Copyright © 2019 Nolan Fuchs. All rights reserved.
//

import UIKit
import FlyoverKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapSetup()
    }
    
    let locationDictionary = [
        "Statue of Liberty": FlyoverAwesomePlace.newYorkStatueOfLiberty,
        "New York" : FlyoverAwesomePlace.newYork,
        "New York Central Park" : FlyoverAwesomePlace.centralParkNY,
        "Google Plex" : FlyoverAwesomePlace.googlePlex,
        "Paris Eiffel Tower" : FlyoverAwesomePlace.parisEiffelTower,
        "Sydney Opera House" : FlyoverAwesomePlace.sydneyOperaHouse,
        "London Eye" : FlyoverAwesomePlace.londonEye,
        "Munich Curch" : FlyoverAwesomePlace.munichCurch,
        "Las Vegas Luxor" : FlyoverAwesomePlace.luxorResortLasVegas,
        "SF Golden Gate" : FlyoverAwesomePlace.sanFranciscoGoldenGateBridge,
        "Rome Colosseum" : FlyoverAwesomePlace.romeColosseum,
        "Laguna Beach" : FlyoverAwesomePlace.lagunaBeach
        
    ]
    
    func mapSetup() {
        
        
        mapView.mapType = .hybridFlyover
        mapView.isZoomEnabled = true
        mapView.showsBuildings = true
        mapView.isScrollEnabled = true
        
    }
    

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func locationPicker(_ sender: Any) {
        let rand = locationDictionary.randomElement()
        let camera = FlyoverCamera(mapView: mapView, configuration: FlyoverCamera.Configuration(duration: 7.0, altitude: 300, pitch: 45.0, headingStep: 40))
        camera.start(flyover: (rand?.value)!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            camera.stop()
        }
        
        navigationItem.title = rand?.key ?? "Error Loading Title"
    }
    
}

