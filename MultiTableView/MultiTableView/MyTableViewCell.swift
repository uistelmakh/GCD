//
//  MyTableViewCell.swift
//  MultiTableView
//
//  Created by днс on 12.04.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var indicatorForImage: UIActivityIndicatorView!
    
    @IBOutlet weak var imageViews: UIImageView!
    
    //иметь внутри ячейки иметь уникальные данные
    private var path: String?
    
    override func prepareForReuse() {
        imageViews.image = nil
    }
    
    func configure(path: String) {
        //сохраняем путь когда идет конфигурация
        self.path = path
        indicatorForImage.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: path),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data),
               path == self?.path {
                // self вызывается потому что может быть проблема с зацикливанием
                DispatchQueue.main.async {
                    self?.imageViews.image = image
                    self?.indicatorForImage.stopAnimating()
                }
            }
        }
    }
}

