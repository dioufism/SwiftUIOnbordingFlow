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
    
            PageView(title: "Push Notification", subTitle: "Enable Push", imageName: "bell")
            PageView(title: "BookMarks", subTitle: "Save Places", imageName: "bookmark")
            PageView(title: "Home", subTitle: "Go Home", imageName: "Home")
            PageView(title: "Flight", subTitle: "Book Flights Anytime", imageName: "plane")

        }
        .tabViewStyle(PageTabViewStyle()) // adds swiping style
    }
}

// creating a reusable component
struct PageView: View{
    let title: String
    let subTitle: String
    let imageName: String

    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 30))
                .padding()
            
            Text(subTitle)
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
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
