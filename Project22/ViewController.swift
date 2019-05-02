//
//  ViewController.swift
//  Project22
//
//  Created by Jason Mitchell on 5/1/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var distanceReading: UILabel!
    @IBOutlet var beaconLabel: UILabel!
    var locationManager: CLLocationManager?
    
    let beacons: [UUID: String] = [
        UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!: "Beacon 1",
        UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!: "Beacon 2",
    ]
    
    var currentBeacon: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        for (uuid, identifier) in beacons {
            let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: identifier)
            locationManager?.startMonitoring(for: beaconRegion)
            locationManager?.startRangingBeacons(in: beaconRegion)
        }
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            case .far:
                self.view.backgroundColor = .blue
                self.distanceReading.text = "FAR"
                
            case .near:
                self.view.backgroundColor = .orange
                self.distanceReading.text = "NEAR"
                
            case .immediate:
                self.view.backgroundColor = .red
                self.distanceReading.text = "RIGHT HERE"
                
            default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
                self.beaconLabel.text = ""
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            
            if currentBeacon != beacon.proximityUUID {
                currentBeacon = beacon.proximityUUID
                
                let beaconName = self.beacons[currentBeacon!]!
                beaconLabel.text = beaconName
                showFoundAlert(for: beaconName)
            }
        }
    }
    
    func showFoundAlert(for beacon: String) {
        let ac = UIAlertController(title: "\(beacon) Nearby", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Let's find it!", style: .default))
        present(ac, animated: true)
    }
}
