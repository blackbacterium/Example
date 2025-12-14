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
//    private let secondShadowView = ShadowView(imageName: ShadowViewType.custom.rawValue)
    private let stackView = UIStackView()
    private let numberButton = CustomButton(textButton: "Change number", bgColor: .systemRed)
    private let imageButton = CustomButton(textButton: "Change image", bgColor: .systemGreen)
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
        updateNumbers()
        view.addGradient()
        
        setupLabel()
//        setupView()
        setupStackView()
        view.addSubview(stackView)
        addAction()
        
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
    }
    
    @objc
    private func numberButtonTapped() {
        textLabel.text = helper.getRandomNumber().formatted()
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
    func addAction(){
        numberButton.addTarget(
            self,
            action: #selector(numberButtonTapped),
            for: .touchUpInside)
        
        let action = UIAction { _ in
            let randomImageName = [
                ShadowViewType.fox,
                ShadowViewType.custom
            ].randomElement() ?? ShadowViewType.fox
            
            self.shadowView.updateImage(randomImageName.rawValue)
        }
        imageButton.addAction(action, for: .touchUpInside)
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
//        stackView.addArrangedSubview(secondShadowView)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
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
//            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
            
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}

