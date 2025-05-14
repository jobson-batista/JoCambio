//
//  CurrencyConverterViewController.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

import UIKit

class CurrencyConverterViewController: UIViewController, UIViewProtocol {
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .thePrimary
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewListCurrencies: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
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
        button.backgroundColor = .success
        button.setTitle("Origem", for: .normal)
        button.showsMenuAsPrimaryAction = true
        button.menu = UIMenu(title: "", children: [
            UIAction(title: "USD - United States Dollar", handler: {_ in button.setTitle("USD", for: .normal)}),
            UIAction(title: "EUR - Euro", handler: {_ in button.setTitle("EUR", for: .normal)}),
            UIAction(title: "BRL - Brazilian Real", handler: {_ in button.setTitle("BRL", for: .normal)}),
        ])
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var toCurrencyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .success
        button.setTitle("Destino", for: .normal)
        button.showsMenuAsPrimaryAction = true
        button.menu = UIMenu(title: "", children: [
            UIAction(title: "USD - United States Dollar", handler: {_ in button.setTitle("USD", for: .normal)}),
            UIAction(title: "EUR - Euro", handler: {_ in button.setTitle("EUR", for: .normal)}),
            UIAction(title: "BRL - Brazilian Real", handler: {_ in button.setTitle("BRL", for: .normal)}),
        ])
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var imageConverterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.left.arrow.right.circle.fill")
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
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.clearButtonMode = .whileEditing
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
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .disable
        return textField
    }()
    
    private lazy var goToListCurrencies: UIButton = {
        let button = UIButton()
        button.setTitle("Ver todas as moedas", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
//        button.setImage(UIImage(named: "arrowshape.turn.up.forward"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupHierarchy()
        setupConstraints()
        setupKeyboardObservers()
        setupDismissKeyboardOnTap()
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
            
            // Agora, stackView ANCORADA no contentView corretamente (com padding)
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            stackViewButtons.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            stackViewButtons.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            
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
            
            goToListCurrencies.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func setupHierarchy() {
        stackViewButtons.addArrangedSubview(fromCurrencyButton)
        stackViewButtons.addArrangedSubview(imageConverterImageView)
        stackViewButtons.addArrangedSubview(toCurrencyButton)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(stackViewButtons)
        stackView.addArrangedSubview(fromCurrencyLabel)
        stackView.addArrangedSubview(fromCurrencyTextField)
        stackView.addArrangedSubview(toCurrencyLabel)
        stackView.addArrangedSubview(toCurrencyTextField)
        stackView.addArrangedSubview(goToListCurrencies)
        
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
            print("Antes contentInset = \(scrollView.contentInset)")
            scrollView.contentInset.bottom = keyboardFrame.height + 20
            print("Depois contentInset = \(scrollView.contentInset)")
            print("Teclado apareceu")
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
        print("Teclado sumiu")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
