//
//  ViewController.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2024/06/29.
//
import UIKit

protocol MainView: AnyObject {
    func showTabPageView(_ tabPageVC: UIViewController)
}

class MainViewController: UIViewController {
    
    var presenter: MainPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self, interactor: MakeTabPageVCInteractor())
        presenter.didLoad()
        
        navigationItem.title = "Record"
        
//        NotificationCenter.default.addObserver(self, selector: #selector(tap(_:)), name: .demo, object: nil)
        
    }
    
    @objc func tap(_ notification: Notification) {
        print("addFolderAction")
    }
}

extension MainViewController: MainView {
    
    func showTabPageView(_ tabPageVC: UIViewController) {
        addChild(tabPageVC)
        view.addSubview(tabPageVC.view)
        tabPageVC.didMove(toParent: self)
    }
}
