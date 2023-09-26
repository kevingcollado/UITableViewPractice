//
//  ViewController.swift
//  UITableViewPractice
//
//  Created by Kevin Gustavo Collado on 03/09/23.
//

import UIKit

class ViewController: UIViewController {
    //TableView
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Registrar datos en tabla
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        //Implementar protocolos
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    
}
//MARK: Protocolo - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    //Titulo de secciones
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Europa"
        case 1:
            return "América"
        case 2:
            return "Egipto"
        default:
            return "Asia"
        }
    }
    
    //Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //Número de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return europa.count
        case 1:
            return america.count
        case 2:
            return africa.count
        default:
            return asia.count
        }
    }
    
    //Configuración de celda reusable
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///Recuperar celda, en caso de no existir se crea una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        ///Crear instancia de UIListContentConfiguration.cell y pasar propiedades a la variable de la instancia
        var listContentConfiguration = UIListContentConfiguration.cell()
        
        switch indexPath.section {
        case 0:
            ///Configurar contenido utilizando los datos del modelo en el índice especificado por indexPath
            let modelForEuropa = europa[indexPath.row]
            ///
            listContentConfiguration.text = modelForEuropa.name
            listContentConfiguration.image = UIImage(systemName: modelForEuropa.bandera)
            ///
            cell.contentConfiguration = listContentConfiguration
            return cell
        case 1:
            let modelForAmerica = america[indexPath.row]
            listContentConfiguration.text = modelForAmerica.name
            listContentConfiguration.image = UIImage(systemName: modelForAmerica.bandera)
            cell.contentConfiguration = listContentConfiguration
            return cell
        case 2:
            let modelForAfrica = africa[indexPath.row]
            listContentConfiguration.text = modelForAfrica.name
            listContentConfiguration.image = UIImage(systemName: modelForAfrica.bandera)
            cell.contentConfiguration = listContentConfiguration
            return cell
        default:
            let modelForAsia = asia[indexPath.row]
            listContentConfiguration.text = modelForAsia.name
            listContentConfiguration.image = UIImage(systemName: modelForAsia.bandera)
            cell.contentConfiguration = listContentConfiguration
            return cell
        }
    }
}

//MARK: Protocolo - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print(indexPath.row)
        case 1:
            print(indexPath.row)
        case 2:
            print(indexPath.row)
        default:
            print(indexPath.row)
        }
    }
    
}
