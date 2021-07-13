//
//  AppColorsRemoteDataSourceProtocol.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation

protocol AppColorsRemoteDataSourceProtocol {
    func fetch(success: @escaping (AppColorsDataModel) -> (), failure: @escaping (Error) -> ())
}
