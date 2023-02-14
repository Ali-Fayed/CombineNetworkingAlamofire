//
//  UsersListUseCase.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Combine
import Alamofire
protocol UsersListUseCase {
    func excute() -> AnyPublisher<DataResponse<[UsersModel], ApiError>, Never>
}
