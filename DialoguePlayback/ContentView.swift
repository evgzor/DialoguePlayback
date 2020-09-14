//
//  ContentView.swift
//  DialoguePlayback
//
//  Created by Eugene Zorin on 13.09.2020.
//  Copyright © 2020 Eugene Zorin. All rights reserved.
//

import SwiftUI


struct ContentView : View {
    @State private var alpha: [Double] = Array(repeating: 0, count: Model.readData()!.count)
    @State var offset: CGFloat = UIScreen.main.bounds.height
    @State private var texts: [String] = Model.readData()!.map({ item -> String in
        item.line})
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        ForEach(texts.indices, id: \.self) { index in // show received results
                            ItemRow(text: self.texts[index])
                                .offset(y: self.offset)
                                .onAppear {
                                    withAnimation() {
                                        self.offset -=  96
                                        self.tts.play(text: self.texts[index], delay: 0.5 * Double(index))
                                    }
                            }
                            .animation(Animation.linear(duration: 0.5 * Double(self.texts.count)))
                            .padding(.bottom, 30)
                            .opacity(self.alpha[index] )
                            .transition(
                                AnyTransition.move(edge: .bottom).combined(with: .opacity))
                                .animation(Animation.linear(duration: 0.5))
                        }
                    }
                }
                    .frame(maxWidth: .infinity) 
                    .padding()
                    .padding(.bottom, 0)
                    .edgesIgnoringSafeArea(.bottom)
                    .animation(.easeOut(duration: 1))
            }.onReceive(timer) { timer in
                
                if self.counter >= Model.readData()!.count {
                    self.timer.upstream.connect().cancel()
                    return
                }
                self.alpha[self.counter] = 1
                self.counter += 1
            }
            .navigationBarTitle("Dialogue", displayMode: .inline)
        }
    }
    
    private let tts = TextToSpeechProvider()}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
