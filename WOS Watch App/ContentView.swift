//
//  ContentView.swift
//  WOS Watch App
//
//  Created by Issei Ueda on 2024/03/17.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    
    var viewModel: SessionViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                print("Button pressed")
                sendMessage(index: 0)
            } label: {
                Text("Send Message")
            }
        }
        .padding()
    }
    
    private func sendMessage(index: Int) {
        
        let messages = ["index": index]
        
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SessionViewModel())
    }
}
