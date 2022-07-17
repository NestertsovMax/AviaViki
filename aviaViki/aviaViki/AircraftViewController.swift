//
//  aircraftViewController.swift
//  aviaViki
//
//  Created by M1 on 16.07.2022.
//

import UIKit

class AircraftViewController: UIViewController {
    
    @IBOutlet var aircraftTableView: UITableView!
    var models: [AviaModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        aircraftTableView.delegate = self
        aircraftTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDescriptionAircraftViewController" else { return }
        guard let destVC = segue.destination as? DescriptionAircraftViewController else { return }
        guard let tableCell = sender as? UITableViewCell else { return }
        guard let indexPath = aircraftTableView.indexPath(for: tableCell) else { return }
        destVC.model = models[indexPath.row]
    }
    
}

extension AircraftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AircraftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelTableViewCell", for: indexPath) as! ModelTableViewCell
        let model = models[indexPath.row]
        cell.update(aircraft: model.name, image: model.image)
        return cell
    }
}
