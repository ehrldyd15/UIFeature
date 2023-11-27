//
//  File.swift
//  
//
//  Created by Do Kiyong on 11/24/23.
//

import Foundation
import UIKit
import Lottie

public final class LoadingView: UIView {
    
    public static let shared = LoadingView()
    
    private let contentView: UIView = {
        let view = UIView()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        return view
    }()
    
    private let loadingView: LottieAnimationView = {
        // 기본적으로 해당 Package의 bundle을 외부에 공개하여, 외부에서 리소스에 접근하도록 할 수 있다.
        // 각 리소스들은 bundle의 path or url 을 통해 리소스에 직접 접근하도록 할 수 있는데,
        // jsonFile.json는 path로 외부에 공개하여, 리소스에 직접 접근할 수 있도록 하였다.
        let path = Bundle.module.path(forResource: "loading", ofType: "json")
        let view = LottieAnimationView(filePath: path ?? "")
        
        view.frame.size.width = 200
        view.frame.size.height = 100
        view.loopMode = .loop
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.contentView.frame = self.frame
        self.contentView.backgroundColor = .gray
        
        self.addSubview(self.contentView)

        self.loadingView.center = CGPoint(x: contentView.frame.size.width / 2, y: contentView.frame.size.height / 2)
    
        self.contentView.addSubview(self.loadingView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        DispatchQueue.main.async {
            let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
            window?.addSubview(self)
            
            self.layoutIfNeeded()
            
            self.loadingView.play()
        }
    }
    
    public func hide() {
        DispatchQueue.main.async {
            self.loadingView.stop()
            
            self.removeFromSuperview()
        }
    }
    
}
