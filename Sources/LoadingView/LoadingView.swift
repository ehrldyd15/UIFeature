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

        view.backgroundColor = .clear
        
        return view
    }()
    
    private let loadingView: LottieAnimationView = {
//        let bundle = Bundle.moduleBundle(for: LoadingView.self)
//        let path = bundle?.path(forResource: "loading", ofType: "json")
//        
//        let view = LottieAnimationView(filePath: path ?? "")
        
        let view = LottieAnimationView(name: "loading")

        
        view.frame.size.width = 200
        view.frame.size.height = 100
        view.loopMode = .loop
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.contentView.frame = self.frame
        
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

extension Bundle {
    
    public static func moduleBundle(for object: AnyObject) -> Bundle! {
        Bundle.moduleBundle(forObject: object)
    }

    public static func moduleBundle(forObject: AnyObject) -> Bundle {
        Bundle(for: type(of: forObject))
    }
    
}

