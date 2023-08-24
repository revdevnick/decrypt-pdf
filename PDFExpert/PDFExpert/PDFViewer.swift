//
//  PDFViewer.swift
//  PDFExpert
//
//  Created by Nick Perkins on 8/24/23.
//

import SwiftUI
import PDFKit

struct MyPDFView: View {
    
    let displayedPDFURL: URL
    
    var body: some View {
        PDFKitView(documentURL: displayedPDFURL)
    }
}

struct PDFKitView: UIViewRepresentable {
    
    let documentURL: URL
    
    init(documentURL: URL) {
        self.documentURL = documentURL
    }
    
    func makeUIView(context: Context) -> some UIView {
        
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.documentURL)
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        pdfView.usePageViewController(true)
        pdfView.displayDirection = .horizontal
        
        return pdfView
    }
    
    // we are not updating a PDF, so do nothing with this method
    func updateUIView(_ uiView: UIViewType, context: Context) -> Void {}
}
