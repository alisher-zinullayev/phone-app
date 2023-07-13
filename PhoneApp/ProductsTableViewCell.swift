//
//  ProductsTableViewCell.swift
//  PhoneApp
//
//  Created by Alisher Zinullayev on 05.07.2023.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    static let identifier = "ProductsTableViewCell"
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productTitle)
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints() {
        let productImageConstraints = [
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 90),
            productImage.heightAnchor.constraint(equalToConstant: 90),
        ]
        let productTitleConstraints = [
            productTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            productTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(productImageConstraints)
        NSLayoutConstraint.activate(productTitleConstraints)
    }
    
    public func configure(image: String, title: String) {
        productTitle.text = title
        productImage.image = UIImage(named: image)
    }
    
}
