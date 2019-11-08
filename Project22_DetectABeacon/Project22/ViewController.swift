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
    
    @IBOutlet var circle: UIView!
    @IBOutlet var distanceReading: UILabel!
    @IBOutlet var beaconLabel: UILabel!
    var locationManager: CLLocationManager?
    var currentBeaconUUID: UUID?
    var currentBeaconName: String? {
        if let currentBeacon = currentBeaconUUID {
            return beacons[currentBeacon]
        } else {
            return nil
        }
    }
    
    let beacons: [UUID: String] = [
        UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!: "Beacon 1",
        UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!: "Beacon 2"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
        
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = circle.layer.bounds.width / 2
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
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch distance {
            case .far:
                self.distanceReading.text = "FAR"
                self.circle.backgroundColor = .blue
                self.circle.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                
            case .near:
                self.distanceReading.text = "NEAR"
                self.circle.backgroundColor = .orange
                self.circle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                
            case .immediate:
                self.distanceReading.text = "RIGHT HERE"
                self.circle.backgroundColor = .red
                self.circle.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                
            default:
                self.distanceReading.text = "UNKNOWN"
                self.beaconLabel.text = ""
                self.circle.backgroundColor = .gray
                self.circle.transform = .identity
                
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            beaconLabel.text = currentBeaconName
            
            update(distance: beacon.proximity)
            
            if currentBeaconUUID != beacon.proximityUUID {
                currentBeaconUUID = beacon.proximityUUID
                showFoundAlert()
            }
        }
    }
    
    func showFoundAlert() {
        let ac = UIAlertController(title: "\(currentBeaconName ?? "Beacon") Nearby", message: "UUID:\n\(currentBeaconUUID?.uuidString ?? "")", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Let's find it!", style: .default))
        present(ac, animated: true)
    }
}
