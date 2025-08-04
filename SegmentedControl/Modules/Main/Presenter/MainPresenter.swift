//
//  MainPresenter.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2025/08/04.
//

import Foundation

protocol MainPresentation {
    func didLoad()
}

class MainPresenter {
    weak var view: MainView!
    var makeTabPageVCInteractor: MakeTabPageVCUseCase!
    
    init(view: MainView, interactor: MakeTabPageVCUseCase) {
        self.view = view
        self.makeTabPageVCInteractor = interactor
    }
}

extension MainPresenter: MainPresentation {
    
    func didLoad() {
        makeTabPageVCInteractor.execute() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let tabPageVC):
                self.view.showTabPageView(tabPageVC)
            }
        }
    }
}
