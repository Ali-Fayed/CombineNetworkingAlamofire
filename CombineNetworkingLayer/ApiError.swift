//
//  ApiError.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
struct ApiError: Error, Equatable, Codable {
    var message: String?
    var code: ErrorCode?
    init(_ code: ErrorCode?) {
        self.code = code
    }
    init(_ message: String) {
        self.message = message
    }
    enum CodingKeys: String, CodingKey {
        case message
        case code
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try? values.decode(String.self, forKey: .message)
        code = try? values.decode(ErrorCode.self, forKey: .code)
    }
}
