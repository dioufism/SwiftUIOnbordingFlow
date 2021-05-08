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
                Text("You are on the main page Welcome to the App").padding()
        }
            .navigationTitle("Home")
      }
        .fullScreenCover(isPresented: $shouldShowOnboarding) { // shows onboarding modally
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        }
    }
    
}

//create an onboarding view
struct OnboardingView: View { // this is how we create a view suing swiftui
    
    @Binding var shouldShowOnboarding: Bool  //
    
    var body: some View { // every single view needs a body
        TabView{
            PageView(title: "Push Notification",
                     subTitle: "Enable Push",
                     imageName: "bell",
                     showDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            PageView(title: "BookMarks",
                     subTitle: "Save Places",
                     imageName: "bookmark",
                     showDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            PageView(title: "Home",
                     subTitle: "Go Home",
                     imageName: "Home",
                     showDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            PageView(title: "Flight",
                     subTitle: "Book Flights Anytime",
                     imageName: "plane",
                     showDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding)

        }
        .tabViewStyle(PageTabViewStyle()) // adds swiping style
    }
}

// creating a reusable component
struct PageView: View{
    let title: String
    let subTitle: String
    let imageName: String
    let showDismissButton: Bool
    
    @Binding var shouldShowOnboarding: Bool

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
            
            if showDismissButton {
                Button ( action: {
                    shouldShowOnboarding.toggle()
                },
                    //put your action here
                 label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(6)
                }

                              
            )}

        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
