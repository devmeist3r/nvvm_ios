//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 17/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = self.settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == self.settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // unchec all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
    }
    
    @IBAction func save() {
        dismiss(animated: true, completion: nil)
    }
    
}
