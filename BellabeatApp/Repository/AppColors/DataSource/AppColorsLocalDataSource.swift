//
//  AppColorsLocalDataSource.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

// simulation of caching in database
var appColorsDb: AppColorsDbModel?

class AppColorsLocalDataSource: AppColorsLocalDataSourceProtocol {
    private let mapper: AppColorsDataMapperProtocol
    
    init(mapper: AppColorsDataMapperProtocol = AppColorsDataMapper()) {
        self.mapper = mapper
    }
    
    func get() -> AppColorsDataModel? {
        guard let appColorsDb = appColorsDb else {return nil}
        return mapper.fromDb(dbModel: appColorsDb)
    }
    
    func update(data: AppColorsDataModel) {
        appColorsDb = mapper.toDb(dataModel: data)
    }
}
