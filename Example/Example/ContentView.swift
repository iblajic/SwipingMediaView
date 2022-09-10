//
//  ContentView.swift
//  Example
//
//  Created by J Tan on 9/9/22.
//

//
//  ContentView.swift
//  Example
//
//  Created by J Tan on 9/9/22.
//

import SwiftUI
import SwipingMediaView


struct ContentView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
            Button("Present gallery view") {
                isPresented = true
            }
        }
        .background(Color.blue)
        .fullScreenCover(isPresented: $isPresented) {
            ZStack{
                SwipingMediaView(controllers: [SwipingMediaItem(url: "https://i.redd.it/8t6vk567khm91.jpg",
                                                                   type: .image),
                                                         SwipingMediaItem(url: "https://i.redd.it/gczavw14bfm91.gif",
                                                                   type: .image),
                                                         SwipingMediaItem(url: "https://preview.redd.it/g232r4ymm4l91.gif?format=mp4&s=91cc39ae920fb57e3273aca59f4e273d974e1253",
                                                                   type: .video)].map { UIHostingController(rootView: SwipingMediaItemView(mediaItem: $0,
                                                                                                                                           isPresented: self.$isPresented))},
                                 startingIndex: 1)
            }
            .background(BackgroundCleanerView())
            .ignoresSafeArea(.all)
        }
        .transaction({ transaction in
            if (!isPresented) {
                transaction.disablesAnimations = true
            }
        })
        .ignoresSafeArea(.all)
    }
}