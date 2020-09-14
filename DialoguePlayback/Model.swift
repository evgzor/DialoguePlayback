//
//  Model.swift
//  DialoguePlayback
//
//  Created by Eugene Zorin on 14.09.2020.
//  Copyright © 2020 Eugene Zorin. All rights reserved.
//

import UIKit

struct Model {
    let text: String
    func height() -> CGFloat {
        return text.height(withConstrainedWidth: 0.25 * UIScreen.main.bounds.width, font: UIFont(name: "SFProText-Light", size: 17)!) + 20
    }
    
    static func readData() -> [PurpleDataProvider]? {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return Array(data: data)
              } catch {
                   // handle error
              }
        }
        return nil
    }
}
