//
//  AppColorsRemoteDataSource.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

class AppColorsRemoteDataSource: AppColorsRemoteDataSourceProtocol {
    private let mapper: AppColorsDataMapperProtocol
    private let apiClient: ApiClientProtocol
    
    init(mapper: AppColorsDataMapperProtocol = AppColorsDataMapper(), apiClient: ApiClientProtocol = ApiClient()) {
        self.mapper = mapper
        self.apiClient = apiClient
    }
    
    func fetch(success: @escaping (AppColorsDataModel) -> (), failure: @escaping (Error) -> ()) {
        let path = "interview.json"
        let parameters: [String: Any] = [:]
        
        apiClient.get(path: path, parameters: parameters, success: { [weak self] (response: AppColorsApiModel) in
            guard let self = self else { return }
            let dataModel = self.mapper.fromApi(apiModel: response)
            success(dataModel)
        }, failure: failure)
    }
}
