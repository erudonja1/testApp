//
//  AppColorDataMapper.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation
protocol AppColorsDataMapperProtocol {
    func fromApi(apiModel: AppColorsApiModel) -> AppColorsDataModel
    func fromDb(dbModel: AppColorsDbModel) -> AppColorsDataModel
    func toDb(dataModel: AppColorsDataModel) -> AppColorsDbModel
}

class AppColorsDataMapper: AppColorsDataMapperProtocol {
    func fromApi(apiModel: AppColorsApiModel) -> AppColorsDataModel {
        // map background colors
        var backgroundColors: [AppColorsDataModel.AppColorItem] = []
        for color in apiModel.colors.background_colors {
            let appColorItem = AppColorsDataModel.AppColorItem(value: color)
            backgroundColors.append(appColorItem)
        }
        
        // map text colors
        var textColors: [AppColorsDataModel.AppColorItem] = []
        for color in apiModel.colors.text_colors {
            let appColorItem = AppColorsDataModel.AppColorItem(value: color)
            textColors.append(appColorItem)
        }
        
        
        return AppColorsDataModel(title: apiModel.title ?? "", backgroundColors: backgroundColors, textColors: textColors)
    }

    
    func fromDb(dbModel: AppColorsDbModel) -> AppColorsDataModel {
        // map background colors
        var backgroundColors: [AppColorsDataModel.AppColorItem] = []
        for color in dbModel.backgroundColors {
            let appColorItem = AppColorsDataModel.AppColorItem(value: color.value)
            backgroundColors.append(appColorItem)
        }
        
        // map text colors
        var textColors: [AppColorsDataModel.AppColorItem] = []
        for color in dbModel.textColors {
            let appColorItem = AppColorsDataModel.AppColorItem(value: color.value)
            textColors.append(appColorItem)
        }
        
        
        return AppColorsDataModel(title: dbModel.title, backgroundColors: backgroundColors, textColors: textColors)
    }
    
    func toDb(dataModel: AppColorsDataModel) -> AppColorsDbModel {
        // map background colors
        var backgroundColors: [AppColorsDbModel.AppColorDbItem] = []
        for color in dataModel.backgroundColors {
            let appColorItem = AppColorsDbModel.AppColorDbItem(value: color.value)
            backgroundColors.append(appColorItem)
        }
        
        // map text colors
        var textColors: [AppColorsDbModel.AppColorDbItem] = []
        for color in dataModel.textColors {
            let appColorItem = AppColorsDbModel.AppColorDbItem(value: color.value)
            textColors.append(appColorItem)
        }
        return AppColorsDbModel(title: dataModel.title, backgroundColors: backgroundColors, textColors: textColors)
    }
}
