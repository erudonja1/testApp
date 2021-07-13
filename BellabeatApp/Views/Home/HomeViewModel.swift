//
//  HomeViewModel.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation
import UIKit

// view controller implements this as an output component
protocol HomeViewModelDelegate: class {
    func titleLoaded()
    func backgroundColorLoaded()
    func textColorLoaded()
    func showError(message: String)
}

class HomeViewModel: NSObject {
    let repository: AppColorsRepositoryProtocol
    var titleData: String = ""
    var backgroundColorHex: String = ""
    var textColorHex: String = ""
    
    weak var output: HomeViewModelDelegate?
    private var randomSelectedIndex: Int = -1
    
    init(repository: AppColorsRepositoryProtocol = AppColorsRepository(), delegate: HomeViewModelDelegate) {
        self.repository = repository
        self.output = delegate
    }
    
    func fetchData() {
        self.repository.getTitle() {[weak self] (title) in
            guard let self = self else {return}
            self.titleData = title
            self.output?.titleLoaded()
        } failure: {[weak self] (error) in
            guard let self = self else {return}
            self.output?.showError(message: error.localizedDescription)
        }
    }
    
    func fetchBackgroundColors() {
        self.repository.getColors(type: .background) {[weak self] (colors) in
            guard let self = self else {return}
            self.randomSelectedIndex = self.randomColor(array: colors)
            self.backgroundColorHex = colors[self.randomSelectedIndex].value
            self.output?.backgroundColorLoaded()
        } failure: {[weak self] (error) in
            guard let self = self else {return}
            self.output?.showError(message: error.localizedDescription)
        }
    }
    
    func fetchTextColors() {
        self.repository.getColors(type: .text) {[weak self] (colors) in
            guard let self = self else {return}
            self.randomSelectedIndex = self.randomColor(array: colors)
            self.textColorHex = colors[self.randomSelectedIndex].value
            self.output?.textColorLoaded()
        } failure: {[weak self] (error) in
            guard let self = self else {return}
            self.output?.showError(message: error.localizedDescription)
        }
    }
    
    private func randomColor(array: [AppColor]) -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        if randomIndex == randomSelectedIndex {
            let newIndex = Int(arc4random_uniform(UInt32(array.count)))
            return newIndex
        }
        
        return randomIndex
    }
}
