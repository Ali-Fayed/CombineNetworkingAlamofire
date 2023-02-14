//
//  UsersViewController.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import CombineDataSources
import Combine
class UsersViewController: CustomViewController<UsersViewModel, AppCoordinator> {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableViewDataSource()
        subcribeOnAPiError()
    }
    // MARK: - Main Methods
    private func bindTableViewDataSource() {
        guard let viewModel = viewModel else {return}
        viewModel.usersListSubject
            .bind(subscriber: tableView.rowsSubscriber(cellIdentifier: "usersCell", cellType: UITableViewCell.self, cellConfig: { cell, indexPath, usersModel in
                cell.textLabel?.text = usersModel.userName
            })).store(in: &subscriptions)
    }
    private func subcribeOnAPiError() {
        guard let viewModel = viewModel else {return}
        viewModel.errorSubject
            .sink { [weak self] error in
                guard let self = self else {return}
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                self.present(alert, animated: true)
            }.store(in: &subscriptions)
    }
}
