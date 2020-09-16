//
//  FindDeals.swift
//  AppEnvironmentObject
//
//  Created by Ananda Afryan Gemilang on 13/09/20.
//  Copyright © 2020 Ananda Afryan Gemilang. All rights reserved.
//

import SwiftUI

struct FindDeals: View {
    var body: some View {
        ZStack {
            TabView {
                FindDealsHome()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Home")
                }
                FindDealsHome()
                .tabItem{
                    Image(systemName: "bookmark")
                    Text("Favourites")
                }
                FindDealsHome()
                .tabItem{
                    Image(systemName: "briefcase")
                    Text("Trips")
                }
                FindDealsHome()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }.accentColor(.blue)
    }
}

struct FindDeals_Previews: PreviewProvider {
    static var previews: some View {
        FindDeals()
    }
}

struct FindDealsHome: View {
    @State private var name = ""
    let data : [DataModel] = [
        DataModel(id: 1, pictureName: "image1", cityName: "Miami", amountOfProperties: 15000),
        DataModel(id: 2, pictureName: "image2", cityName: "Los Angeles", amountOfProperties: 15000),
        DataModel(id: 3, pictureName: "image3", cityName: "Connecticut", amountOfProperties: 15000),
        DataModel(id: 4, pictureName: "image4", cityName: "New York", amountOfProperties: 15000),
        DataModel(id: 5, pictureName: "image5", cityName: "Alabama", amountOfProperties: 15000),
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Find Deals").font(.largeTitle).bold()
                    HStack {
                        Image("magnifyingglass")
                            .foregroundColor(Color.gray)
                        TextField("Search city", text: self.$name)
                    }.padding(15.0)
                    .border(Color.gray)
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 2))
                    )
                }.padding([.leading, .trailing], 20)
                HStack{
                    Text("Popular Places").bold()
                    Spacer()
                    Button(action: {}) {
                        Text("View all")
                        .bold()
                        .foregroundColor(Color.gray)
                    }
                }.padding([.leading, .trailing, .top], 20)
                ForEach(data) { row in
                    VStack {
                        Content(data: row)
                    }
                }
            }
            .navigationBarItems(
                leading:
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello, Alex").font(.headline).foregroundColor(Color.gray)
                    }
                },
                trailing:
                Button(action: {print("Hello World")}) {
                    Image(systemName: "tray.full")
                    .foregroundColor(Color.secondary)
                }
            )
        }
    }
}

struct Content: View {
    @State private var name = ""
    let data: DataModel
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(self.data.pictureName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                VStack(alignment: .leading) {
                    Text(self.data.cityName).foregroundColor(Color.white).bold().font(.title)
                    Text("$ \(self.data.amountOfProperties) properties").foregroundColor(Color.white).font(.caption)
                }.padding()
            }.cornerRadius(10)
        }
    }
}
