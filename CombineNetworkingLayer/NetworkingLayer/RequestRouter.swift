//
//  RequestsRouter.swift
//  Advanced Networking Layer
//
//  Created by Ali Fayed on 12/11/2021.
//
import Alamofire
import Foundation
enum RequestRouter {
    case usersList
    //MARK: - BaseURL
    var baseURL: String {
        switch self {
        case .usersList:
            return "https://api.github.com"
        }
    }
    //MARK: - Path
    var path: String {
        switch self {
        case .usersList:
            return "/users"
        }
    }
    //MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .usersList:
            return .get
        }
    }
    //MARK: - Parameters or Body
    var parameters: [String: String]? {
        switch self {
        case .usersList:
            return nil
        }
    }
}
     // MARK: - URLRequestConvertible
extension RequestRouter: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL().appendingPathComponent(path)
    var request = URLRequest(url: url)
    request.method = method
    if method == .get {
      request = try URLEncodedFormParameterEncoder()
        .encode(parameters, into: request)
    } else if method == .post {
      request = try JSONParameterEncoder().encode(parameters, into: request)
    }
    return request
  }
}
