//
//  ViewController.swift
//  UIButtonProject
//
//  Created by yousef mandani on 28/02/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let inputText = UITextField()
    let button = UIButton()
    var selectedImage = "man"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        autoLayout()
        setupUI()
        
        button.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func addSubviews(){
        view.addSubview(imageView)
        view.addSubview(inputText)
        view.addSubview(button)
    }

    func autoLayout(){
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(300)
        }
        
        inputText.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(inputText.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.width.equalTo(100)
        }
    }
    
    func setupUI(){
        inputText.placeholder = "Choose an image"
        inputText.backgroundColor = .white
        inputText.layer.cornerRadius = 10
        inputText.textAlignment = .center
        
        imageView.image = UIImage(named: selectedImage)
        
        button.backgroundColor = .systemBlue
        button.setTitle("Enter", for: .normal)
        button.layer.cornerRadius = 10
    }
    
    @objc func loadImage(){
        selectedImage = inputText.text?.lowercased() ?? ""
        imageView.image = UIImage(named: selectedImage)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

