//
//  Model.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
struct UsersModel: Hashable {
    let userName: String
    enum UsersCodingKeys: String, CodingKey {
        case userName = "login"
    }
}
extension UsersModel: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UsersCodingKeys.self)
        userName = try container.decode(String.self, forKey: .userName)
    }
}
