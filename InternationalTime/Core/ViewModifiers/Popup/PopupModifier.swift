//
//  PopupModifier.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import SwiftUI

extension View {
    func popup<PopupView>(isPresented: Binding<Bool>, content: () -> PopupView) -> some View where PopupView: View {
        let alertVC = PopupHostedViewController(isPresented: isPresented, rootView: content())
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.view.backgroundColor = UIColor.clear
        alertVC.modalTransitionStyle = .crossDissolve

        if isPresented.wrappedValue {
            let viewController = topViewController()
            viewController?.present(alertVC, animated: true, completion: nil)
        } else {
            alertVC.dismiss(animated: true, completion: nil)
        }

        return self
    }
    
    private func topViewController(baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = baseVC as? UINavigationController {
            return topViewController(baseVC: nav.visibleViewController)
        }
        if let tab = baseVC as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(baseVC: selected)
            }
        }
        if let presented = baseVC?.presentedViewController {
            return topViewController(baseVC: presented)
        }
        return baseVC
    }
}
