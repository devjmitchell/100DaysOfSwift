//
//  ViewController.swift
//  Project7
//
//  Created by Jason Mitchell on 3/10/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allPetitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Petitions"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credit", style: .plain, target: self, action: #selector(showCredit))
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
//            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
//            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
        showError()
    }
    
    @objc func filter() {
        let ac = UIAlertController(title: "Filter Petitions?", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Filter", style: .default) {
            [weak self, weak ac] _ in
            guard let query = ac?.textFields?[0].text else { return }
            self?.submit(query)
        }
        let showAllAction = UIAlertAction(title: "Show All", style: .cancel) { _ in
            self.filteredPetitions = self.allPetitions
            self.tableView.reloadData()
        }
        
        ac.addAction(submitAction)
        ac.addAction(showAllAction)
        present(ac, animated: true)
    }
    
    func submit(_ query: String) {
        if !query.isEmpty {
            let lowerQuery = query.lowercased()
            filteredPetitions = allPetitions.filter { $0.title.lowercased().contains(lowerQuery) || $0.body.lowercased().contains(lowerQuery) }
        } else {
            filteredPetitions = allPetitions
        }
        
        if filteredPetitions.isEmpty {
            filteredPetitions = allPetitions
            let ac = UIAlertController(title: "Not Found", message: "Sorry, no petitions were found containing \"\(query)\"", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
        tableView.reloadData()
    }
    
    @objc func showCredit() {
        let ac = UIAlertController(title: "We The People", message: "This list is populated with petitions that can be seen on whitehouse.gov", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Sounds Good!", style: .default))
        present(ac, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            allPetitions = jsonPetitions.results
            filteredPetitions = allPetitions
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
