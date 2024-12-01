//
//  AnimatedBarView.swift
//  
//
//  Created by Татьяна on 01.12.2024.
//

import UIKit

class AnimatedBarView: UIView {
    private let barColor: UIColor
    
    private lazy var backgroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = barColor.withAlphaComponent(0.2)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var foregroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = barColor
        view.alpha = 0.0
        return view
    }()
    
    //MARK: - Layout
    private func layout() {
        addSubview(backgroundBarView)
        backgroundBarView.addSubview(foregroundBarView)
        backgroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        foregroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundBarView)
        }
        
    }
    
    //MARK: - Init
    init(barColor: UIColor) {
        self.barColor = barColor
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
