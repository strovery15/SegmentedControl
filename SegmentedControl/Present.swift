//
//  Present.swift
//  SegmentedControl
//
//  Created by 川前優太 on 2025/03/26.
//

import Foundation

protocol PresentPresentation {
    func didSelectCell()
}

class Present {
    
    weak var view: ViewProtocol!
    
    init(view: ViewProtocol) {
        self.view = view
    }
}

extension Present: PresentPresentation {
    
    func didSelectCell() {
        print("selected!")
    }
    
}
