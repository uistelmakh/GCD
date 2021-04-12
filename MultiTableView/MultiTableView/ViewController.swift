//
//  ViewController.swift
//  MultiTableView
//
//  Created by днс on 12.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var images: [String] = ["https://avatars.mds.yandex.net/get-pdb/932587/a556719f-1d29-4bdd-8a83-d17b5ab87c6c/s1200", "https://www.sakhaparliament.ru/images/Burnasheva/IMG_20200412_123139.jpg", "https://i1.wp.com/today.kz/static/uploads/cb42e8fb-e288-4faa-a5fb-7da9128c91d5.JPEG", "https://www.culture.ru/storage/images/649ed5ba651560aef883e63022d2e1bf/7b3da5068b65de4e482a0d1707abb802.jpg", "https://a.d-cd.net/a7bcd51s-1920.jpg"]
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell {
            cell.configure(path: images[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
