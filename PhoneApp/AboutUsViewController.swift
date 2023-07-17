//
//  AboutUsViewController.swift
//  PhoneApp
//
//  Created by Alisher Zinullayev on 05.07.2023.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let contactSymbols = ["envelope.circle.fill", "phone.circle.fill", "cursorarrow.square.fill"]
    private let contactDetails = ["good-as-old@example.com", "412-888-9028", "www.example.com"]
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image5")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let aboutUs: UILabel = {
        let label = UILabel()
        label.text = "About Us"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstText: UILabel = {
        let label = UILabel()
        label.text = "Good as Old Phones returns the phones of yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most: \n \n \nWhether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected"
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondText: UILabel = {
        let label = UILabel()
        label.text = "*Hands-free phones available"
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactsLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupViews()
        setupContactsStackView()
    }
    
    private func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        contentView.addSubview(mainImage)
        mainImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentView.addSubview(aboutUs)
        aboutUs.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        aboutUs.topAnchor.constraint(equalTo: mainImage.bottomAnchor).isActive = true
        contentView.addSubview(firstText)
        firstText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        firstText.topAnchor.constraint(equalTo: aboutUs.bottomAnchor, constant: 50).isActive = true
        firstText.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/5).isActive = true
        contentView.addSubview(secondText)
        secondText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        secondText.topAnchor.constraint(equalTo: firstText.bottomAnchor, constant: 40).isActive = true
        secondText.leadingAnchor.constraint(equalTo: firstText.leadingAnchor).isActive = true
        contentView.addSubview(contactsLabel)
        contactsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        contactsLabel.topAnchor.constraint(equalTo: secondText.bottomAnchor, constant: 40).isActive = true
    }
    
    
    private func setupContactsStackView() {
        let contactsStackView = UIStackView()
        contactsStackView.axis = .vertical
        contactsStackView.spacing = 16
        contactsStackView.distribution = .equalSpacing
        contactsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0..<contactSymbols.count {
            let symbol = contactSymbols[i]
            let name = contactDetails[i]
            
            let symbolImageView = UIImageView(image: UIImage(systemName: symbol))
            symbolImageView.tintColor = .black
            symbolImageView.contentMode = .scaleAspectFit
            symbolImageView.translatesAutoresizingMaskIntoConstraints = false
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.font = UIFont.systemFont(ofSize: 14)
            nameLabel.textColor = .black
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let stackView = UIStackView(arrangedSubviews: [symbolImageView, nameLabel])
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            contactsStackView.addArrangedSubview(stackView)
        }
        
        contentView.addSubview(contactsStackView)
        
        contactsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        contactsStackView.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor, constant: 30).isActive = true
        contactsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
