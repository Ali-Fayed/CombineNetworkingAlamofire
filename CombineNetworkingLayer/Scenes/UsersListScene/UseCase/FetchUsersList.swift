//
//  FetchUsersList.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Combine
import Alamofire
final class FetchPrayTimes: UsersListUseCase {
    typealias returnType = AnyPublisher<DataResponse<[UsersModel], ApiError>, Never>
    func excute() -> returnType {
        let responsePublisher: returnType = NetworkingManger.shared.performRequest(router: RequestRouter.usersList)
        return responsePublisher
    }
}
