//
//  SecondViewController.swift
//  gcdTest
//
//  Created by днс on 09.04.2021.
//

import UIKit

class SecondViewController: UIViewController {

    let imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "vc2"
        loadPhoto()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createImage()
    }
    
    func createImage() {
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
    
    func loadPhoto() {
        guard let imageURL : URL = URL(string: "https://www.millionpodarkov.ru/incoming_img/fotolight-promo.ru/7987315.jpg") else {return}
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }

}
