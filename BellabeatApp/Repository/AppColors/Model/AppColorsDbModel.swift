//
//  AppColorDbModel.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

struct AppColorsDbModel {
    let title: String
    let backgroundColors: [AppColorDbItem]
    let textColors: [AppColorDbItem]
    
    struct AppColorDbItem {
        let value: String
    }
}
