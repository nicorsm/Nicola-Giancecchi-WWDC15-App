//
//  NGSanMarinoInfoViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit
import MapKit

class NGSanMarinoInfoViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coord : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:
            43.934843, longitude: 12.447047)
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.20, longitudeDelta: 0.20)
        let region = MKCoordinateRegionMake(coord, span)
        
        self.mapView.setRegion(region, animated: true)
        
        self.navigationItem.title = "REPUBLIC OF SAN MARINO"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#255979")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
