//
//  TextToSpeechProvider.swift
//  DialoguePlayback
//
//  Created by Eugene Zorin on 14.09.2020.
//  Copyright © 2020 Eugene Zorin. All rights reserved.
//

import Foundation
import AVFoundation

struct TextToSpeechProvider {
     private let synthesizer = AVSpeechSynthesizer()
    
    func play(text: String, delay: TimeInterval)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.3
            
            
            self.synthesizer.speak(utterance)
        }
    }
}
