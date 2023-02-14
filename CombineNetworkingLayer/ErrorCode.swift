//
//  ErrorCode.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
enum ErrorCode: String, Codable {
    case general
}
extension ErrorCode {
    var errorDescription: String? {
        switch self {
        default:
            return "Error occured while accessing the service. Please try again later."
        }
    }
}
