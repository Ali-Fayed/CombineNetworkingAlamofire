//
//  UsersViewModel.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Combine
class UsersViewModel {
    private var useCase: UsersListUseCase?
    private var subscriptions: Set<AnyCancellable> = []
    private var usersList = [UsersModel]()
    var usersListSubject = PassthroughSubject<[UsersModel], Never>()
    let errorSubject = PassthroughSubject<ApiError, Never>()
    init(useCase: UsersListUseCase?) {
        self.useCase = useCase
        fetchUsersList()
    }
    func fetchUsersList() {
        let request = useCase?.excute()
        request?.sink { [weak self] (response) in
            guard let self = self else {return}
            switch response.result {
              case .success(let model):
                DispatchQueue.main.async {
                    self.usersList = model
                    self.usersListSubject.send(self.usersList)
                }
              case .failure(let error):
                DispatchQueue.main.async {
                    self.errorSubject.send(error)
                }
            }
        }.store(in: &subscriptions)
    }
}
