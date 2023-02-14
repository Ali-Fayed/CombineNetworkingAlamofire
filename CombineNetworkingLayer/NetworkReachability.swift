//
//  NetworkReachability.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import Alamofire
class NetworkReachability {
  static let shared = NetworkReachability()
  private init() {}
  let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
  let offlineAlertController: UIAlertController = {
    UIAlertController(title: "No Network", message: "Please connect to network and try again", preferredStyle: .alert)
  }()
  func startNetworkMonitoring() {
    reachabilityManager?.startListening { status in
      switch status {
      case .notReachable:
        self.showOfflineAlert()
      case .reachable(.cellular):
        self.dismissOfflineAlert()
      case .reachable(.ethernetOrWiFi):
        self.dismissOfflineAlert()
      case .unknown:
        print("Unknown network state")
      }
    }
  }
  func showOfflineAlert() {
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
          let rootViewController = windowScene.windows.first?.rootViewController
          rootViewController?.present(offlineAlertController, animated: true, completion: nil)
      }
  }
  func dismissOfflineAlert() {
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
          let rootViewController = windowScene.windows.first?.rootViewController
          rootViewController?.dismiss(animated: true, completion: nil)
      }
  }
}
