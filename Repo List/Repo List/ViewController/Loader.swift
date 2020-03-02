//
//  Loader.swift
//  Repo List
//
//  Created by Max Kuzmovych on 02.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import UIKit
import SwiftUI

struct Loader: UIViewRepresentable {
    
    var isAnimating: Bool
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
