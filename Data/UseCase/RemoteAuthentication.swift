//
//  RemoteAuthentication.swift
//  Data
//
//  Created by Sabrina on 08/10/21.
//

import Foundation
import Domain

public final class RemoteAuthentication: Authentication {
    private let url:URL
    private let HttpClient: HttpPostClient
    
    public init(url: URL, HttpClient: HttpPostClient) {
        self.url = url
        self.HttpClient = HttpClient
    }
    
    public func auth(authenticationModel: AuthenticationModel, completion: @escaping (Authentication.Result) -> Void) {
        HttpClient.post(to: url, with: authenticationModel.toData()) { [weak self] Result in
            guard self != nil else { return }
            switch Result {
            case .success(let data):
                if let model: AccountModel = data?.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
            case .failure(let error):
                switch error {
                case .unauthorized:
                    completion(.failure(.expiredSession))
                default:
                    completion(.failure(.unexpected))
                }
            }
         }
     }
}
