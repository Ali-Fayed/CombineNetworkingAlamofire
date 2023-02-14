//
//  AppStoryboards.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import UIKit
enum AppStoryboards: String {
    case main = "Main"
}
class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = UsersViewController.instaintiate(on: .main)
        vc.title = "Users"
        let viewModel = UsersViewModel(useCase: FetchPrayTimes())
        vc.bind(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
