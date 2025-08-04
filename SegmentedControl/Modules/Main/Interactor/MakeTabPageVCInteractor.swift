//
//  TabPageViewCreateInteractor.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2025/08/04.
//

import TabPageViewController

protocol MakeTabPageVCUseCase {
    func execute(completion: ((Result<TabPageViewController, Never>) -> ())?)
}

class MakeTabPageVCInteractor: MakeTabPageVCUseCase {
    
    func execute(completion: ((Result<TabPageViewController, Never>) -> ())?) {
        let tabPageVC = TabPageViewController()
        tabPageVC.tabItems = makeTabItems()
        tabPageVC.option.tabHeight = 50
        tabPageVC.option.tabMargin = 20
        tabPageVC.option.fontSize = 14
        tabPageVC.option.currentBarHeight = 3
        tabPageVC.option.currentColor = .white
        tabPageVC.option.defaultColor = .systemGray4
        tabPageVC.option.tabBackgroundColor = .systemTeal
        completion?(.success(tabPageVC))
    }
    
    private func makeTabItems() -> [(UIViewController, String)] {
        var tabItems: [(UIViewController, String)] = []
        let storyboard = UIStoryboard(name: "TabPageChild", bundle: nil)
        
        let number = ["1", "2", "3", "4", "5", "6", "7", "8"]
        let fruit = ["fruit", "#Apple🍎", "#Banana🍌", "#Lemon🍋", "#Melon🍈", "#Grape🍇","#Strawbery🍓", "#PineApple🍍", "#Orange🍊", "#Cherry🍒", "#Peach🍑", "#Blueberry🫐", "#Watermelon🍉"]
        let prefecture = ["愛知県", "東京都", "福岡県", "兵庫県", "北海道", "山口県", "茨城県", "沖縄県", "石川県"]
        let subject = ["数学", "国語", "理科", "社会", "体育", "英語"]
        
        let numberView = storyboard.instantiateViewController(identifier: "Child") { coder in
            return TabPageChildViewController(coder: coder, items: number)
        }
        let fruitView = storyboard.instantiateViewController(identifier: "Child") { coder in
            return TabPageChildViewController(coder: coder, items: fruit)
        }
        let prefectureView = storyboard.instantiateViewController(identifier: "Child") { coder in
            return TabPageChildViewController(coder: coder, items: prefecture)
        }
        let subjectView = storyboard.instantiateViewController(identifier: "Child") { coder in
            return TabPageChildViewController(coder: coder, items: subject)
        }
        
        tabItems = [(numberView, "Number"), (fruitView, "fruit"), (prefectureView, "都道府県"), (subjectView, "教科")]
        
        return tabItems
    }
    
}


