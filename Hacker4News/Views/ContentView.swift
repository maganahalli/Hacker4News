//
//  ContentView.swift
//  Hacker4News
//
//  Created by Venkatesh Maganahalli on 7/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts){ post in
                
                NavigationLink.init(
                    destination: DetailsView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                        Text(post.title)
                        }
                    })
                
            .padding(.horizontal)
        }
        .navigationBarTitle("Hacker 4 NEWS")
        }
        
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//Post(id: "1", title: "Hello, Universe"),
//    Post(id: "2", title: "Bye, Universw"),
//    Post(id: "3", title: "Hello, World"),
//        Post(id: "4", title: "Bye, World")
//]

