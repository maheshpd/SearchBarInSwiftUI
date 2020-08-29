//
//  ContentView.swift
//  SearchBarInSwiftUI
//
//  Created by Mahesh Prasad on 29/08/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["hello","Hi","Welcome","World","asdasd","uhuhu"]
    @State var txt = ""
    
    var body: some View {
        
        
        VStack {
            searchView(txt: $txt)
            
            List(datas.filter{txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)}, id: \.self) {
                i in
                
                Text(i).fontWeight(.heavy)
            }
        }
        
        
        //        VStack {
        //
        //            searchView(txt: $txt)
        //
        //            List(datas.filter(txt == "" ? true : $0.localizedCaseInsensitiveContains(txt))) { i in
        //
        //            }
        //
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct searchView : UIViewRepresentable {
    
    @Binding var txt : String
    
    func makeCoordinator() -> Coordinator {
        return searchView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<searchView>) -> UISearchBar {
        
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.delegate = context.coordinator
        searchbar.autocapitalizationType = .none
        return searchbar
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<searchView>) {
        
    }
    
    class Coordinator : NSObject, UISearchBarDelegate {
        
        var parent : searchView!
        
        init(parent1 : searchView) {
            parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            parent.txt = searchText
            
        }
    }
    
    
}
