//
//  APIError.swift
//
//
//  .
//  . All rights reserved.
//

import Foundation

enum APIError: Error {
    case message(String)

    var localizedDescription: String {
        switch self {
        case .message(let string):
            return string
        }
    }

}
