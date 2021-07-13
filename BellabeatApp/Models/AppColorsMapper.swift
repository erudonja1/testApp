//
//  AppColorsMapper.swift
//  BellabeatApp
//
//  Created by Elvis on 7/14/21.
//

import Foundation
import UIKit

protocol AppColorsMapperProtocol {
    func fromData(type: AppColorsDataType, dataModel: AppColorsDataModel) -> [AppColor]
}

class AppColorsMapper: AppColorsMapperProtocol {
    func fromData(type: AppColorsDataType, dataModel: AppColorsDataModel) -> [AppColor] {
        switch type {
        case .background:
            var backgroundColors: [AppColor] = []
            for color in dataModel.backgroundColors {
                let appColorItem = AppColor(value: color.value, name: color.value)
                backgroundColors.append(appColorItem)
            }
            return backgroundColors
        case .text:
            var textColors: [AppColor] = []
            for color in dataModel.textColors {
                let appColorItem = AppColor(value: color.value, name: color.value)
                textColors.append(appColorItem)
            }
            return textColors
        }
    }
}

