//
//  Coordinator.swift
//  JoCambio
//
//  Created by Jobson on 17/05/25.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
}
