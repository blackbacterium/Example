//
//  ViewController.swift
//  ExampleApp
//
//  Created by Black Bacterium on 04.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    private let textLabel = UILabel()
    private let imageView = UIImageView()
    private let imageContainerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        setupImageView()
        setupImageContainerView()
        setupView()
        view.addSubview(textLabel)
        view.addSubview(imageContainerView)
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = firstNumber?.formatted()
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .red
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "Лиса")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    private func setupImageContainerView() {
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 10
        
        imageContainerView.addSubview(imageView)
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor)
        ])
    }
}
