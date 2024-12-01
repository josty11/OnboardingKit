//
//  OnboardingViewController.swift
//  
//
//  Created by Татьяна on 01.12.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    private let slides: [Slide]
    private let tintColor: UIColor
    
    private lazy var transitionView: TransitionView = {
        let view = TransitionView(slides: slides, viewTintColor: tintColor)
        return view
    }()
    
    private lazy var buttonContainerView: ButtonContainerView = {
        let view = ButtonContainerView(tintColor: tintColor)
        view.nextButtonDidTap = {
            print("Next Button tapped")
        }
        view.getStartedButtonDidTap = {
            print("Get started Button tapped")
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transitionView, buttonContainerView])
        view.axis = .vertical
        return view
    }()
    
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
        super.init(nibName: nil, bundle: nil)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitionView.start()
    }
    
    //MARK: - UI Setup
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        
        buttonContainerView.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
    }
}
