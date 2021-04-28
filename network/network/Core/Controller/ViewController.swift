//
//  ViewController.swift
//  network
//
//  Created by Sergey Stelmakh on 28.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NewTableViewCell.nib(), forCellReuseIdentifier: NewTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        networkManager.getAllPosts { [weak self](posts) in
            DispatchQueue.main.async {
                self?.posts = posts
            }
            
        }
       
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.identifier, for: indexPath) as? NewTableViewCell {
            cell.configure(posts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
