//
//  ContentView.swift
//  AppEnvironmentObject
//
//  Created by Ananda Afryan Gemilang on 13/09/20.
//  Copyright © 2020 Ananda Afryan Gemilang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View {
        ZStack(alignment: .bottomLeading ) {
            Image("imagebackground")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                 Text("Are you ready ?")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.bottom, 20)
                    .fixedSize()
                Text("Find your hotel easily and travel anywhere you want with us.")
                   .font(.headline)
                   .foregroundColor(Color.white)
                   .padding(.bottom, 20)
                Button(action: {}){
                    HStack {
                        Spacer()
                        HStack {
                            Text("Let's start")
                            .font(.callout)
                            .padding()
                        }
                        Spacer()
                    }
                }
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }.padding(30)
        }
    }
}
