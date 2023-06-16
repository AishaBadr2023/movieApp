//
//  ToastHelper.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import Foundation
import Toast_Swift

class ToastHelper {
    static func showToast (message: String , icon: String) {
        let topView =  UIApplication.shared.topViewController()?.view
        let topCenter = CGPoint.init(x: (topView?.center ?? .zero).x, y: 110)
        var style = ToastStyle()
        style.imageSize =  CGSize.init(width: 20, height: 20)
        style.backgroundColor = .white
        style.messageColor = .black

        topView?.makeToast(message, duration: 5, point: topCenter , title: nil, image: UIImage(named: icon),style: style,completion: nil)
    }
}
