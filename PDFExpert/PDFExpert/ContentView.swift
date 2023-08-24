//
//  ContentView.swift
//  PDFExpert
//
//  Created by Nick Perkins on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showActionSheet: Bool = false
    @State private var selectedPDFURL: URL = URL(fileURLWithPath: "")
    @State private var isPDFViewActive: Bool = false
    @State private var isAlertViewActive: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    self.showActionSheet.toggle()
                } label: {
                    Text("Open PDF")
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .fileImporter(isPresented: $showActionSheet, allowedContentTypes: [.pdf]) { result in
                    switch result {
                    case .success(let pdfUrl):
                        isPDFViewActive = true
                        selectedPDFURL = pdfUrl
                        let gotAccess = selectedPDFURL.startAccessingSecurityScopedResource()
                        if !gotAccess { return }
                        showActionSheet = false
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        isAlertViewActive = true
                        showActionSheet = false
                    }
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $isPDFViewActive, destination: {
            MyPDFView(displayedPDFURL: selectedPDFURL)
        })
        .alert("Error Opening PDF", isPresented: $isAlertViewActive) {
            Button("OK", role: .cancel) {
                isAlertViewActive = false
            }
        } message: {
            Text(self.errorMessage)
        }
    }
}



#Preview {
    ContentView()
}
