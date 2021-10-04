//
//  UseCaseFactory.swift
//  Main
//
//  Created by Sabrina on 01/10/21.
//

import Foundation
import Data
import Infra
import Domain

public class UseCaseFactory {
    private static let httpClient = AlamofireAdapter()
    private static let apiBaseUrl = "https://fordevs.herokuapp.com/api"
    
    private static func makeUrl(path: String) -> URL {
        return URL(string: "\(apiBaseUrl)/\(path)")!
    }
    
    static func makeRemoteAddAccount() -> AddAccount {
        return RemoteAddAccount(url: makeUrl(path: "signup"), HttpClient: httpClient)
    }
}
