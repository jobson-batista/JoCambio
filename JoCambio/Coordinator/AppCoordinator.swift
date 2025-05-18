//
//  AppCoordinato.swift
//  JoCambio
//
//  Created by Jobson on 17/05/25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CurrencyConverterViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToCurrencyList() {
        let currencyListViewController = CurrencyListViewController()
        navigationController.pushViewController(currencyListViewController, animated: true)
    }
}
