//
//  ProductDetailViewController.swift
//  PhoneApp
//
//  Created by Alisher Zinullayev on 06.07.2023.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var productTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD TO CART", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        let goldColor = UIColor(
            red: CGFloat(0xD4) / 255.0,
            green: CGFloat(0xAF) / 255.0,
            blue: CGFloat(0x37) / 255.0,
            alpha: 1.0
        )
        button.backgroundColor = goldColor
        return button
    }()

    var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(productImage)
        view.addSubview(productTitle)
        view.addSubview(addButton)
        applyConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func applyConstraints() {
        let productTitleConstraints = [
            productTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            productTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]

        let addButtonConstraints = [
            addButton.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 60),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        let productImageConstraints = [
            productImage.topAnchor.constraint(equalTo: view.topAnchor),
            productImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        NSLayoutConstraint.activate(productImageConstraints)
        NSLayoutConstraint.activate(productTitleConstraints)
        NSLayoutConstraint.activate(addButtonConstraints)
    }
}

