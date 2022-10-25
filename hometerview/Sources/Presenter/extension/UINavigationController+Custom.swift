//
//  UINavigationController+Custom.swift
//  hometerview
//
//  Created by 김혜리 on 2022/10/25.
//

import Foundation

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "",
                                                                   style: .plain,
                                                                   target: nil,
                                                                   action: nil)
    }
}
