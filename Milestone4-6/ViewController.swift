//
//  ViewController.swift
//  Milestone4-6
//
//  Created by Jason Mitchell on 3/10/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearShoppingList))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    @objc func clearShoppingList() {
//        shoppingList.removeAll(keepingCapacity: true)
//        tableView.reloadData()
        
        let ac = UIAlertController(title: "Clear List", message: "Are you sure you would like to clear the list?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Do it!", style: .destructive) { _ in
//            self.clear()
            self.shoppingList.removeAll(keepingCapacity: true)
            self.tableView.reloadData()
        }
        let declineAction = UIAlertAction(title: "Nevermind", style: .cancel)
        
        ac.addAction(confirmAction)
        ac.addAction(declineAction)
        present(ac, animated: true)
    }
    
//    func clear() {
//        shoppingList.removeAll(keepingCapacity: true)
//        tableView.reloadData()
//    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        if !item.isEmpty {
            shoppingList.insert(item, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
