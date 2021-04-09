//
//  ViewController.swift
//  gcdTest
//
//  Created by днс on 09.04.2021.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "vc1"
        
        button.addTarget(self, action: #selector(goNextScreen), for: .touchUpInside)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createButton()
    }
    
    func createButton() {
        button.backgroundColor = .blue
        button.setTitle("Go", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func goNextScreen() {
        let vc2 = SecondViewController()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
}

