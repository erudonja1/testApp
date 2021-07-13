//
//  ColorPickerViewController.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var abandonedColor: UIColor = UIColor()
    var colorSelected: (UIColor) -> Void = { _ in }
    var viewModel: ColorPickerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        viewModel?.fetchData()
    }
}

extension ColorPickerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        let index = indexPath.row
        if let viewModel = viewModel {
            let color = viewModel.data[index]
            let uiColor = UIColor(hexString: color.value)
            cell.alpha = 1
            
            if uiColor == abandonedColor {
                cell.textLabel?.text = "Vec odabrana boja"
                cell.alpha = 0.4
            }
            
            cell.backgroundColor = uiColor
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let index = indexPath.row
        if let viewModel = viewModel {
            let color = viewModel.data[index]
            let uiColor = UIColor(hexString: color.value)
            
            if uiColor != abandonedColor {
                self.colorSelected(uiColor)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension ColorPickerViewController: ColorPickerViewModelDelegate {
    func dataLoaded() {
        self.tableView.reloadData()
    }
    
    func showError(message: String) {
        // alert
    }
}
