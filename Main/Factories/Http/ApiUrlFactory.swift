//
//  ApiUrlFactory.swift
//  Main
//
//  Created by Sabrina on 08/10/21.
//

import Foundation

func makeApiUrl(path: String) -> URL {
    return URL(string: "\(Environment.variable(.apiBaseUrl))/\(path)")!
}
