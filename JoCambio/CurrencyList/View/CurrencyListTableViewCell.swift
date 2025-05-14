//
//  CurrencyListTableViewCell.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

import UIKit

class CurrencyListTableViewCell: UITableViewCell, UIViewProtocol {
    
    static let identifier: String = "CurrencyListTableViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var converterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.left.arrow.right.circle.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        contentView.backgroundColor = .background
        
        setupHierarchy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            converterImage.widthAnchor.constraint(equalToConstant: 30),
            converterImage.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func setupHierarchy() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(converterImage)
        
        contentView.addSubview(stackView)
    }
    
    func setLabelCell(name: String, code: String) {
        nameLabel.text = "\(code) - \(name)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 5
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        self.contentView.layer.shadowColor = UIColor.label.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowRadius = 2
        self.contentView.backgroundColor = .theSecondary
    }
    
}
