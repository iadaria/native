//
//  ContentView.swift
//  TravelDiscoveryIAD
//
//  Created by Якимова Дарья on 06.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            

            
            ScrollView() {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0..<15, id: \.self) { num in
                            VStack (spacing: 4) {
                                Spacer()
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray)
                                    .cornerRadius(.infinity)
                                    .shadow(color: .gray, radius: 4, x:0.0, y:2)
                                Text("Art")
                                    .font(.system(size:12, weight: .semibold))
                            }
                        }
                    }.padding(.horizontal)
                    
                }.background(Color.red)

                //Text("TEST")
            }.navigationTitle("Discover")
            
            
        }
    }
}

#Preview {
    ContentView()
}
