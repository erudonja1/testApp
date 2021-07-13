//
//  AppColorDataModel.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

struct AppColorsDataModel {
    let title: String
    let backgroundColors: [AppColorItem]
    let textColors: [AppColorItem]
    
    struct AppColorItem {
        let value: String
    }
}
