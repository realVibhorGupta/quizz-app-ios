//
//  Questions.swift
//  QuizzApp
//
//  Created by Vibhor Gupta on 9/20/19.
//  Copyright © 2019 Vibhor Gupta. All rights reserved.
//

import Foundation
class Questions: NSObject {

    var question : String? = nil
    var answer : Bool? = false


    required init(text : String , rightAnswer : Bool) {
        question = text
        answer = rightAnswer
    }

}
