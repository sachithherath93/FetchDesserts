//
//  Utilities.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/14/22.
//

// Some helper functions
import Foundation
import UIKit

extension UIView {
    func pinToSuperView(_ superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let viewConstraints: [NSLayoutConstraint] = [self.topAnchor.constraint(equalTo: superView.topAnchor),
                                    self.leftAnchor.constraint(equalTo: superView.leftAnchor),
                                    self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
                                    self.rightAnchor.constraint(equalTo: superView.rightAnchor)]
        NSLayoutConstraint.activate(viewConstraints)
    }
}
