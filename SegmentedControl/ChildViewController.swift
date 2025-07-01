//
//  ChildCollectionViewViewController.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2024/07/01.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var folder = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init?(coder: NSCoder, folder: [String]) {
        self.folder = folder
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    

extension ChildViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        folder.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = folder[indexPath.row + 1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(self.folder[0])_\(indexPath.row)")
    }
    
}


