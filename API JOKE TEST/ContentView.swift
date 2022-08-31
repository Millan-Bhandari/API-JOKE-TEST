//
//  ContentView.swift
//  API JOKE TEST
//
//  Created by Millan Bhandari on 8/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var setup = String()
    @State private var delivery = String()
    @State private var text = ""
    var body: some View {
        Text("Text")
            .onTapGesture {
                getJokes()
            }
            .onAppear {
                getJokes()
            }
        Text(text)
            .padding()
        Button("Button") {
            getJokes()
            text = setup
        }
    }
    func getJokes() {
        let apiKey = "?rapidapi-key=d57ad2586dmsh41318fe19aa4036p18c098jsn6cb0e627a4c9"
        let query = "https://jokeapi-v2.p.rapidapi.com/joke/Any\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                    let contents = json.arrayValue
                    for item in contents {
                        let set = item["delivery"].stringValue
                        setup.append(set)
                }
                return
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
