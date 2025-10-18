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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        setupImageView()
        setupView()
        view.addSubview(textLabel)
        view.addSubview(imageView)
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
        textLabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "Лиса")
        imageView.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 10
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
}

