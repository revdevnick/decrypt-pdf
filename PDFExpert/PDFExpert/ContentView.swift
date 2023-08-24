//
//  ContentView.swift
//  PDFExpert
//
//  Created by Nick Perkins on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showActionSheet = false
    
    var body: some View {
        VStack {
            Button {
                self.showActionSheet.toggle()
            } label: {
                Text("Open PDF")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .fileImporter(isPresented: $showActionSheet, allowedContentTypes: [.pdf]) { result in
                print("!!! \(result)")
            }
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
