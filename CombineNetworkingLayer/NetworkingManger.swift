//
//  NetworkingManger.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Alamofire
import Combine
struct NetworkingManger {
    static let shared = NetworkingManger()
    private init() {}
    typealias returnType<T: Codable> = AnyPublisher<DataResponse<T, ApiError>, Never>
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        
        let networkLogger = EventsMonitor()
        let interceptor = RequestsInterceptor()
        
        return Session(
            configuration: configuration,
            interceptor: interceptor,
            cachedResponseHandler: responseCacher,
            eventMonitors: [networkLogger])
    }()
    func performRequest<T: Codable>(router: URLRequestConvertible) -> returnType<T> {
        return sessionManager.request(router)
            .validate(statusCode: 200..<300)
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    let error = response.data.flatMap {
                        try? JSONDecoder().decode(ApiError.self, from: $0)
                    }
                    return error ?? ApiError(.general)
                }
            }.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
}
