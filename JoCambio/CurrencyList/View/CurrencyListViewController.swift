//
//  CurrencyConverterViewController.swift
//  JoCambio
//
//  Created by Jobson on 12/05/25.
//

import UIKit

class CurrencyListViewController: UIViewController, UIViewProtocol {
    
    let names = ["Dolar","Euro", "Real"]
    let codes = ["USD","EUR","BRL"]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var currencyListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: CurrencyListTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        stackView.addArrangedSubview(currencyListTableView)
        
        view.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            currencyListTableView.topAnchor.constraint(equalTo: stackView.topAnchor),
            currencyListTableView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            currencyListTableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            currencyListTableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            
        ])
    }
    
}


extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListTableViewCell", for: indexPath) as? CurrencyListTableViewCell else {
            return UITableViewCell()
        }
        
        let code = codes[indexPath.row]
        let name = names[indexPath.row]
        
        cell.setLabelCell(name: name, code: code)
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
