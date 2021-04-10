//
//  ViewController.swift
//  DispWorkItem
//
//  Created by днс on 10.04.2021.
//

import UIKit

class ViewController: UIViewController {

    let imageURL = "https://www.google.ru/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png"
    let imageView = UIImageView()

    fileprivate func createImageView() {
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createImageView()
    }
    
    
    //-----------------------ClassicMethod-----------------------
    func fetchImage() {
        guard let url = URL(string: imageURL) else {
            return
        }
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    
    //-----------------------DispatchWorkItem-----------------------
    func dispatchWorkItemMethod() {
        guard let url = URL(string: imageURL) else {
            return
        }
        let queue = DispatchQueue.global(qos: .utility)
        var data: Data?
        let workItem = DispatchWorkItem {
            data = try? Data(contentsOf: url)
        }
        
        queue.async(execute: workItem)
        workItem.notify(queue: DispatchQueue.main) {
            if let imageData = data {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }


    //-----------------------URLSession-----------------------
    func urlSessionMethod() {
        guard let url = URL(string: imageURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
}

