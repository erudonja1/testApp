//
//  ColorPickerViewModel.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

// view-model implements this as description
protocol ColorPickerViewModelProtocol {
    func fetchData()
}

// view controller implements this as an output component
protocol ColorPickerViewModelDelegate: class {
    func dataLoaded()
    func showError(message: String)
}

class ColorPickerViewModel: ColorPickerViewModelProtocol {
    let repository: AppColorsRepositoryProtocol
    let type: AppColorType
    var data: [AppColor] = []
    weak var output: ColorPickerViewModelDelegate?
    
    init(repository: AppColorsRepositoryProtocol = AppColorsRepository(), delegate: ColorPickerViewModelDelegate, type: AppColorType) {
        self.repository = repository
        self.output = delegate
        self.type = type
    }
    
    func fetchData() {
        self.repository.getColors(type: type) {[weak self] (appColors) in
            guard let self = self else {return}
            self.data = appColors
            self.output?.dataLoaded()
        } failure: {[weak self] (error) in
            guard let self = self else {return}
            self.output?.showError(message: error.localizedDescription)
        }
    }
}
