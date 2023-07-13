//
//  ViewController.swift
//  PhoneApp
//
//  Created by Alisher Zinullayev on 05.07.2023.
//

import UIKit

class ProductsViewController: UIViewController {
    
    
    let productNames: [String] = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Moto Portable"]
    let productImageNames: [String] = ["image1", "image2", "image3","image4"]
    
    
    private let productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(productsTableView)
        productsTableView.delegate = self
        productsTableView.dataSource = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productsTableView.frame = view.bounds
    }
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier, for: indexPath) as? ProductsTableViewCell else {return UITableViewCell()}
        cell.configure(image: productImageNames[indexPath.row], title: productNames[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productsDetailVC = ProductDetailViewController()
        productsDetailVC.productTitle.text = productNames[indexPath.row]
        productsDetailVC.productImage.image = UIImage(named: productImageNames[indexPath.row])
        navigationController?.pushViewController(productsDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

