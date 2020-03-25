//
//  ContentView.swift
//  TinderSwipe
//
//  Created by Ramill Ibragimov on 25.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var x: [CGFloat] = [0, 0, 0, 0, 0, 0, 0]
    @State private var degree: [Double] = [0, 0, 0, 0, 0, 0, 0]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            Button(action: {
                for i in 0..<self.x.count {
                    self.x[i] = 0
                }
                for i in 0..<self.degree.count {
                    self.degree[i] = 0
                }
            }) {
                Image(systemName: "return")
                    .font(.title)
            }
            ZStack {
                ForEach(0..<7, id: \.self) { i in
                    Card()
                        .offset(x: self.x[i])
                        .rotationEffect(.init(degrees: self.degree[i]))
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                if value.translation.width > 0 {
                                    self.x[i] = value.translation.width
                                    self.degree[i] = 8
                                } else {
                                    self.x[i] = value.translation.width
                                    self.degree[i] = -8
                                }
                            })
                            .onEnded({ (value) in
                                if value.translation.width > 0 {
                                    if value.translation.width > 100 {
                                        self.x[i] = 500
                                        self.degree[i] = 12
                                    } else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                } else {
                                    if value.translation.width < -100 {
                                        self.x[i] = -500
                                        self.degree[i] = -15
                                    } else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                }
                            })
                        )
                }
            }.padding()
            .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                Image("woman")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 410)
                
                HStack(spacing: 25) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark.seal")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.orange)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bolt")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                }.padding()
            }.background(Color.white)
            .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Izabella")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text("23")
                    .font(.body)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }.padding(.bottom, 100)
            .padding(.leading, 10)
        }
    }
}
