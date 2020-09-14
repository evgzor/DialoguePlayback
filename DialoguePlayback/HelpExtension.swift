//
//  HelpExtension.swift
//  DialoguePlayback
//
//  Created by Eugene Zorin on 13.09.2020.
//  Copyright © 2020 Eugene Zorin. All rights reserved.
//


import Foundation
import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }
}

