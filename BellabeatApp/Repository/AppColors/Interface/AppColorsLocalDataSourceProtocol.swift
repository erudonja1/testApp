//
//  AppColorsLocalDataSourceProtocol.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

protocol AppColorsLocalDataSourceProtocol {
    func get() -> AppColorsDataModel?
    func update(data: AppColorsDataModel)
}
