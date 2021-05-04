//
//  ContentView.swift
//  SwiftUIOnbordingFlow
//
//  Created by ousmane diouf on 5/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("you are on the main page").padding()
        }
            .navigationTitle("Home")
      }
        
    }
}

//create a view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
