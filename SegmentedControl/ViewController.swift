//
//  ViewController.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2024/06/29.
//
import UIKit
import TabPageViewController



class ViewController: UIViewController {
    
    var child: TabPageViewController!
    
    var number = ["Number", "1", "2", "3", "4", "5", "6", "7", "8"]
    var fruit = ["fruit", "#Apple🍎", "#Banana🍌", "#Lemon🍋", "#Melon🍈", "#Grape🍇","#Strawbery🍓", "#PineApple🍍", "#Orange🍊", "#Cherry🍒", "#Peach🍑", "#Blueberry🫐", "#Watermelon🍉"]
    var prefecter = ["都道府県", "愛知県", "東京都", "福岡県", "兵庫県", "北海道", "山口県", "茨城県", "沖縄県", "石川県"]
    var subject = ["教科", "数学", "国語", "理科", "社会", "体育", "英語"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Record"
        
        self.createTabPageview()
//        NotificationCenter.default.addObserver(self, selector: #selector(tap(_:)), name: .demo, object: nil)
        
    }
    
    func createTabPageview() {
        
        let vc1 = storyboard!.instantiateViewController(identifier: "child") { [self] coder in
            return ChildViewController(coder: coder, folder: self.number)
        }
        let vc2 = storyboard!.instantiateViewController(identifier: "child") { [self] coder in
            return ChildViewController(coder: coder, folder: self.fruit)
        }
        let vc3 = storyboard!.instantiateViewController(identifier: "child") { [self] coder in
            return ChildViewController(coder: coder, folder: self.prefecter)
        }
        let vc4 = storyboard!.instantiateViewController(identifier: "child") { [self] coder in
            return ChildViewController(coder: coder, folder: self.subject)
        }
        
        child = TabPageViewController()
        child.option.tabHeight = 50
        child.option.tabMargin = 20
        child.option.fontSize = 14
        child.option.currentBarHeight = 3
        child.option.currentColor = .systemTeal
        child.option.defaultColor = .systemGray
        child.option.tabBackgroundColor = .systemTeal
        child.tabItems = [(vc1, "Number"), (vc2, "fruit"), (vc3, "都道府県"), (vc4, "教科")]
        
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    @objc func tap(_ notification: Notification) {
        print("addFolderAction")
    }
}
