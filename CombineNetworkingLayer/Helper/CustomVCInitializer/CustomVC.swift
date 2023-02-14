//
//  CustomVC.swift
//  CombineNetworkingLayer
//
//  Created by AliFayed on 14/02/2023.
//

import Foundation
import Foundation
protocol CustomVC: AnyObject {
   associatedtype V
   associatedtype C
   init(viewModel: V?, coordinator: C?)
}
