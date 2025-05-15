//
//  CurrencyConverterViewController.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

import UIKit

class CurrencyConverterViewController: UIViewController, UIViewProtocol {
    
    private var currenciesList: [(key: String, value: String)] = []
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .background
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var spaceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .clear
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return stackView
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "JoCambio"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var fromCurrencyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.tintColor = .primaryText
        button.showsMenuAsPrimaryAction = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    
    private lazy var toCurrencyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.tintColor = .white
        button.showsMenuAsPrimaryAction = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    
    private lazy var imageConverterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.forward.dotted.chevron.forward")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var fromCurrencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quantia"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var fromCurrencyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 0.353, green: 0.353, blue: 0.369, alpha: 1)
        return textField
    }()
    
    private lazy var toCurrencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor Convertido"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var toCurrencyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 0.353, green: 0.353, blue: 0.369, alpha: 1)
        return textField
    }()
    
    private lazy var convertButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Converter", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    
    private lazy var goToListCurrenciesButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Ver todas as moedas", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "eyes.inverse"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupHierarchy()
        setupConstraints()
        setupKeyboardObservers()
        setupDismissKeyboardOnTap()
        setupCurrencyMenu()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            stackViewButtons.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            stackViewButtons.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            stackViewButtons.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            
            fromCurrencyLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            fromCurrencyLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            
            fromCurrencyTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            fromCurrencyTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            fromCurrencyTextField.heightAnchor.constraint(equalToConstant: 40),
            
            toCurrencyLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            toCurrencyLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            
            toCurrencyTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            toCurrencyTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            toCurrencyTextField.heightAnchor.constraint(equalToConstant: 40),
            
            goToListCurrenciesButton.heightAnchor.constraint(equalToConstant: 40),
            
            convertButton.heightAnchor.constraint(equalToConstant: 40),
            convertButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            convertButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            
            imageConverterImageView.heightAnchor.constraint(equalToConstant: 20),
            
            spaceView.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func setupHierarchy() {
        stackViewButtons.addArrangedSubview(fromCurrencyButton)
        stackViewButtons.addArrangedSubview(imageConverterImageView)
        stackViewButtons.addArrangedSubview(toCurrencyButton)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(spaceView)
        stackView.addArrangedSubview(stackViewButtons)
        stackView.addArrangedSubview(fromCurrencyLabel)
        stackView.addArrangedSubview(fromCurrencyTextField)
        stackView.addArrangedSubview(toCurrencyLabel)
        stackView.addArrangedSubview(toCurrencyTextField)
        stackView.addArrangedSubview(convertButton)
        stackView.addArrangedSubview(goToListCurrenciesButton)
        
        contentView.addSubview(stackView)
        
        scrollView.addSubview(contentView)
        
        view.addSubview(scrollView)
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupDismissKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            scrollView.contentInset.bottom = keyboardFrame.height + 20
            Log.info("Teclado apareceu")
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
        Log.info("Teclado sumiu")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func getCurrenciesList() async {
        do {
            let data = try await CurrencyListService.shared.fetchCurrencies()
            self.currenciesList = Array(data).sorted { $0.key < $1.key }
            Log.info("Lista de moedas carregada com sucesso!")
        } catch {
            Log.error("Erro ao carregar Currencies List: \(error)")
        }
    }
    
    private func getUIActionCurrencies(button: UIButton) async -> [UIAction] {
        var actions: [UIAction] = []
        
        for (key, value) in self.currenciesList {
            actions.append(UIAction(title: "\(key) - \(value)", handler: { _ in button.setTitle(key, for: .normal)}))
        }
        return actions
    }
    
    func setupCurrencyMenu() {
        
        Task {
            await getCurrenciesList()
            
            toCurrencyButton.menu = UIMenu(title: "Moeda de Destino", children: await getUIActionCurrencies(button: toCurrencyButton))
            
            fromCurrencyButton.menu = UIMenu(title: "Moeda de Origem", children: await getUIActionCurrencies(button: fromCurrencyButton))
        }

    }
    
}
