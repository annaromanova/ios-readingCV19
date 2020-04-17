//
//  ItemDetail.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

//item view
struct ItemDetail: View {
    
    @EnvironmentObject var userData: UserData
    var item: Item
    
    var itemIndex: Int {
        userData.items.firstIndex(where: { $0.id == item.id })!
    }
    
    //var body
    var body: some View {
        
        //list
        List{
            
            //vstack1
            VStack (alignment: .center){
                                
                DetailImage(image: item.image)
                    .frame(width: 210, height: 210)
                    .padding()
                
                //hstack1
                HStack {
                    //vstack2
                    VStack(alignment: .leading) {
                        Text(item.body)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        //hstack2
                        HStack {
                            Text(item.name)
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                                
                            Spacer()
                            
                            Button(action: {
                                self.userData.items[self.itemIndex]
                                    .isFavorite.toggle()
                            }) {
                                if self.userData.items[self.itemIndex].isFavorite {
                                    Image(systemName: "flag.fill")
                                        .foregroundColor(Color.red)
                                } else {
                                    Image(systemName: "flag")
                                        .foregroundColor(Color.gray)
                                }
                            }
                        //hstack2
                        }
                            
                        Text(item.state)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    //vstack2
                    }
                    .layoutPriority(100)
                    Spacer()
                //hstack1
                }
                .padding()
                
                Spacer()
                Spacer()
                
                LinkButton(link: item.site)

                Spacer()
                
                
                
            //vstack1
            }
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
        
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                )
            .padding([.top, .horizontal])
            .listRowBackground(Color(UIColor.systemGray6))

        //list
        }
        .navigationBarTitle("Reading Collection", displayMode: .inline)

    //var body
    }
    
//item view
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ItemDetail(item: userData.items[6])
            .environmentObject(userData)
    }
}

