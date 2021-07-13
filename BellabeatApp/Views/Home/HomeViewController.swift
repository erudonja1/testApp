//
//  HomeViewController.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var changeTextColorButton: UIButton!
    @IBOutlet weak var changeBackgroundColorButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func changeTextColorButtonPressed(_ sender: Any) {
        guard let navigationController = self.navigationController else {return}
        let colorPickerRouter = ColorPickerRouter(navigationController: navigationController)
        let abandonedColor = self.view.backgroundColor ?? UIColor()
        colorPickerRouter.navigateToTextColorPicker(abandonedColor: abandonedColor, colorSelected: setTextColor)
    }
    
    @IBAction func changeBackgroundColorButtonPressed(_ sender: Any) {
        guard let navigationController = self.navigationController else {return}
        let colorPickerRouter = ColorPickerRouter(navigationController: navigationController)
        let abandonedColor = self.titleLabel.textColor ?? UIColor()
        colorPickerRouter.navigateToBackgroundColorPicker(abandonedColor: abandonedColor, colorSelected: setBackgroundColor)
    }
}

extension HomeViewController {
    func setTextColor(color: UIColor) {
        DispatchQueue.main.async {
            self.titleLabel.textColor = color
        }
    }
    
    func setBackgroundColor(color: UIColor) {
        DispatchQueue.main.async {
            self.view.backgroundColor = color
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func titleLoaded() {
        self.titleLabel.text = viewModel?.titleData
        self.viewModel?.fetchBackgroundColors()
    }
    
    func backgroundColorLoaded() {
        self.view.backgroundColor = UIColor(hexString: viewModel?.backgroundColorHex ?? "")
        self.viewModel?.fetchTextColors()
    }
    
    func textColorLoaded() {
        self.titleLabel.textColor = UIColor(hexString: viewModel?.textColorHex ?? "")
    }
    
    func showError(message: String) {
        // alert
    }
}
