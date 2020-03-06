//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 15/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWheatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var datasource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//            self.datasource = WeatherDataSource(self.weatherListViewModel)
//            self.tableView.dataSource = self.datasource
//        }
        self.datasource = WeatherDataSource(self.weatherListViewModel)
        self.tableView.dataSource = self.datasource
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddWeatherCitySegue":
            prepareSegueForAddWeatherCityViewController(segue: segue)
            break
        case "SettingsSegue":
            prepareSegueForSettingsTableViewController(segue: segue)
            break
        case "DetailsSegue":
            prepareSegueForWeatherDetailsViewController(segue: segue)
            break
        default: break
        }
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
        
        let waetherVC = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = waetherVC
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        settingsTVC.delegate = self
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        
        addWeatherCityVC.delegate = self
        
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.weatherListViewModel.numberOfRows(section)
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
//        
//        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
//        
//        cell.configure(weatherVM)
//        
//        return cell
//    }
    
    
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}
