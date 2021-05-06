//
//  ContentView.swift
//  SwiftUIOnbordingFlow
//
//  Created by ousmane diouf on 5/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldShowOnboarding: Bool =  true // determines whether we shiuld show the onboarding
    
    var body: some View {
        NavigationView{
            VStack{
                Text("you are on the main page").padding()
        }
            .navigationTitle("Home")
      }
        .fullScreenCover(isPresented: $shouldShowOnboarding) { // shows onboarding modally
            OnboardingView()
        }
    }
    
}

//create an onboarding view

struct OnboardingView: View { // this is how we create a view suing swiftui
    
    var body: some View { // every single view needs a body
        TabView{
            
            PageView()
                .background(Color.red)
            
            PageView()
                .background(Color.blue)
            
            PageView()
                .background(Color.green)
            
            PageView()
                .background(Color.orange)
            
        }
        .tabViewStyle(PageTabViewStyle()) // adds swiping style
    }
}

// creating a reusable component
struct PageView: View{
    
    var body: some View {
        VStack{
            Image(systemName: "bell")
                .resizable()
                .padding()
            
            Text("Push Notification")
                .font(.system(size: 30))
                .padding()
            
            Text("Enable Notification")
                .font(.system(size: 30))
                .foregroundColor(Color(.secondaryLabel))
                .padding()

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
