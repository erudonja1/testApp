//
//  ColorsRepository.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

protocol AppColorsRepositoryProtocol {
    func getColors(type: AppColorType, success: @escaping ([AppColor]) -> (), failure: @escaping (Error) -> ())
    func getTitle(success: @escaping (String) -> (), failure: @escaping (Error) -> ())
}

class AppColorsRepository: AppColorsRepositoryProtocol {
    private let localDataSource: AppColorsLocalDataSourceProtocol
    private let remoteDataSource: AppColorsRemoteDataSourceProtocol
    private let mapper: AppColorsMapperProtocol
    
    init(localDataSource: AppColorsLocalDataSourceProtocol = AppColorsLocalDataSource(),
         remoteDataSource: AppColorsRemoteDataSourceProtocol = AppColorsRemoteDataSource(),
         mapper: AppColorsMapperProtocol = AppColorsMapper()) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    
    func getColors(type: AppColorType, success: @escaping ([AppColor]) -> (), failure: @escaping (Error) -> ()) {
        
        // if there are items in local storage, return them
        let localData = localDataSource.get()
        if let localData = localData {
            switch type {
            case .background:
                let domainResult = self.mapper.fromData(type: .background, dataModel: localData)
                success(domainResult)
            case .text:
                let domainResult = self.mapper.fromData(type: .text, dataModel: localData)
                success(domainResult)
            }
        }
        
        remoteDataSource.fetch(success: {[weak self] dataModel in
            guard let self = self else { return }
            switch type {
            case .background:
                let domainResult = self.mapper.fromData(type: .background, dataModel: dataModel)
                success(domainResult)
            case .text:
                let domainResult = self.mapper.fromData(type: .text, dataModel: dataModel)
                success(domainResult)
            }
        }, failure: failure)
    }
    
    func getTitle(success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        // if there are items in local storage, return them
        let localData = localDataSource.get()
        if let localData = localData {
            success(localData.title)
        }
        
        remoteDataSource.fetch(success: { dataModel in
            success(dataModel.title)
        }, failure: failure)
    }
}
