//
//  AppColorApiModel.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

struct AppColorsApiModel: Decodable {
    let title: String?
    let colors: AppColorApiItem

    struct AppColorApiItem: Decodable {
        let background_colors: [String]
        let text_colors: [String]
    }
}
