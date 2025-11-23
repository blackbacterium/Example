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
    private let shadowView = ShadowView(imageName: ShadowViewType.fox.rawValue)
    private let secondShadowView = ShadowView(imageName: ShadowViewType.custom.rawValue)
    private let stackView = UIStackView()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
//        setupView()
        view.addGradient()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(randomNumber)
    }
}

// MARK: - Nested types
extension ViewController {
    enum ShadowViewType: String {
        case fox = "fox"
        case custom = "custom"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}

// MARK: - Setup View
private extension ViewController {
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
    }
    
    func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = firstNumber?.formatted()
        textLabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textLabel.textAlignment = .center
        textLabel.textColor = .red
    }
    
//    func setupView() {
//        let gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        
//        view.layer.insertSublayer(gradient, at: 0)
//    }
}

//MARK: - Setup Layout
private extension ViewController {
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
}

