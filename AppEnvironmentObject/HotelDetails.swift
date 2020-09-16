//
//  HotelDetails.swift
//  AppEnvironmentObject
//
//  Created by Ananda Afryan Gemilang on 13/09/20.
//  Copyright © 2020 Ananda Afryan Gemilang. All rights reserved.
//

import SwiftUI

struct HotelDetails: View {
    var body: some View {
        ZStack {
            TabView {
                ExploreDeals()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Home")
                }
                ExploreDeals()
                .tabItem{
                    Image(systemName: "bookmark")
                    Text("Favourites")
                }
                ExploreDeals()
                .tabItem{
                    Image(systemName: "briefcase")
                    Text("Trips")
                }
                ExploreDeals()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }.accentColor(.blue)
    }
}

struct HotelDetails_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetails()
    }
}

struct ExploreDeals: View {
    let data : [HotelDetailsCityModel] = [
        HotelDetailsCityModel(id: 1, pictureName: "image6", hotelName: "Hotel Pennsylvania", hotelPrice: "300", hotelAddress: "Manhattan, New York", hotelNights: "3x4 Nights", hotelDistance: 5),
        HotelDetailsCityModel(id: 2, pictureName: "image7", hotelName: "Bod Times Square", hotelPrice: "400", hotelAddress: "Manhattan, New York", hotelNights: "3x4 Nights", hotelDistance: 6)
    ]
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        FilterView()
                    }.padding()
                    HStack {
                        categoryButton()
                    }.padding()
                    HStack {
                        Text("315").fontWeight(.heavy)
                        Text("Properties found").foregroundColor(.gray)
                    }.padding(10).cornerRadius(20)
                    .frame(minWidth: 0, maxWidth: .infinity).background(lightGreyColor).padding([.leading, .trailing])
                }
                ForEach(data) { row in
                    VStack(spacing: 10) {
                        DealItems(data: row)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading:
                HStack {
                    VStack(alignment: .leading) {
                        Text("New York").font(.largeTitle).bold().foregroundColor(.black)
                    }
                },
                trailing:
                NumberView()
            )
        }
    }
}

struct NumberView : View {
    @State var amountNumberView: Int = 1
    var body : some View {
        ZStack {
            Image(systemName: "gear")
            .resizable()
            .foregroundColor(Color.blue)
            .frame(width:20, height: 20)
            Text("1")
                .foregroundColor(Color.white)
                .frame(width:7,height: 7)
                .font(.caption)
                .padding(5)
                .background(Color.blue)
                .clipShape(Circle())
                .offset(x:10, y:-10)
        }
    }
}

struct FilterView : View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var body : some View {
        HStack {
            Text("11 - 15 Dec").fontWeight(.bold).padding(6).border(Color.gray).foregroundColor(Color.blue)
            Text("3 guests").fontWeight(.bold).padding(6).border(Color.gray).foregroundColor(Color.blue)
            Text("4 nights").fontWeight(.bold).padding(6).border(Color.gray).foregroundColor(Color.blue)
        }
    }
}

struct categoryButton : View {
    var body : some View {
        HStack(alignment: .firstTextBaseline) {
            Button(action: {}) {
                Text("Top").fontWeight(.heavy).foregroundColor(.black)
            }
            Button(action: {}) {
                Text("Cheapest").fontWeight(.medium).foregroundColor(.black)
            }
            Button(action: {}) {
                Text("Rating & Price").fontWeight(.medium).foregroundColor(.black)
            }
            Button(action: {}) {
                Text("Comfort").fontWeight(.medium).foregroundColor(.black)
            }
        }.padding(.bottom, 5)
    }
}

struct DealItems: View {
    let data: HotelDetailsCityModel
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing){
                Image(self.data.pictureName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                HStack {
                    Image(systemName: "bookmark").padding(10).background(Color.blue).foregroundColor(Color.white).cornerRadius(5).padding()
                    Spacer()
                    Text("5.7") .padding(10).foregroundColor(Color.white).background(Color.orange).cornerRadius(5).padding()
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(self.data.hotelName).bold()
                    Spacer()
                    Text(self.data.hotelPrice).bold()
                }
                HStack {
                    Text(self.data.hotelAddress).foregroundColor(Color.gray).font(.caption)
                    Spacer()
                    Text(self.data.hotelNights).bold().foregroundColor(Color.gray).font(.caption)
                }
                HStack {
                    Image(systemName: "location").padding(10).foregroundColor(Color.white).background(Color.blue).cornerRadius(5)
                    Text("\(self.data.hotelDistance) km from centre").bold().foregroundColor(Color.black).font(.caption).bold()
                }
            }.padding(20)
        }
        .background(lightGreyColor)
        .cornerRadius(10)
        .padding()
    }
}
