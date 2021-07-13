//
//  ColorPickerRouter.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation
import UIKit

class ColorPickerRouter: NSObject {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToBackgroundColorPicker(abandonedColor: UIColor, colorSelected: @escaping (UIColor) -> Void) {
        let colorPickerVC = ColorPickerViewController()
        let viewModel = ColorPickerViewModel(delegate: colorPickerVC, type: .background)
        colorPickerVC.viewModel = viewModel
        colorPickerVC.colorSelected = colorSelected
        colorPickerVC.abandonedColor = abandonedColor
        navigationController.pushViewController(colorPickerVC, animated: true)
    }
    
    func navigateToTextColorPicker(abandonedColor: UIColor, colorSelected: @escaping (UIColor) -> Void) {
        let colorPickerVC = ColorPickerViewController()
        let viewModel = ColorPickerViewModel(delegate: colorPickerVC, type: .text)
        colorPickerVC.viewModel = viewModel
        colorPickerVC.colorSelected = colorSelected
        colorPickerVC.abandonedColor = abandonedColor
        navigationController.pushViewController(colorPickerVC, animated: true)
    }
}
