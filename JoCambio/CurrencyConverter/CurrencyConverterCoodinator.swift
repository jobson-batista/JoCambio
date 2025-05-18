//
//  CurrencyConverterCoodinator.swift
//  JoCambio
//
//  Created by Jobson on 17/05/25.
//

import UIKit

class CurrencyConverterCoodinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CurrencyConverterViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
