//
//  ViewController.swift
//  Milestone10-12
//
//  Created by Jason Mitchell on 3/25/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var things = [Thing]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        let defaults = UserDefaults.standard
        
        if let savedThings = defaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                things = try jsonDecoder.decode([Thing].self, from: savedThings)
            } catch {
                print("Failed to load things.")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Thing", for: indexPath)
        cell.textLabel?.text = things[indexPath.row]
        return cell
    }
}

