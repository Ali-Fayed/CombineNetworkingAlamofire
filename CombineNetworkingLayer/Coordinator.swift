//
//  Coordinator.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
