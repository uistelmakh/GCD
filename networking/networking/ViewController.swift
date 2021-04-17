//
//  ViewController.swift
//  networking
//
//  Created by днс on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func dowloadPosts(_ sender: Any) {
        networkManager.getAllPosts { (posts) in
            DispatchQueue.main.async { [weak self] in
                self?.label.text = "posts has been downloaded"
            }
        }
    }
}

