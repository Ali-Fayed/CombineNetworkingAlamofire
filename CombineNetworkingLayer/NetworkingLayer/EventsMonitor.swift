//
//  EventsMonitor.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Alamofire
class EventsMonitor: EventMonitor {
  func requestDidFinish(_ request: Request) {
    print(request.description)
  }
}
