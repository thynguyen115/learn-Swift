//
//  CircleImage.swift
//  Landmarks
//
//  Created by Thy Nguyen on 8/10/21.
//  Instructed by Apple-UK Swift Tutorial
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        // name of the image "turtlerock"
        // make the image Circle by .clipShape(Circle())
        // add another layer behind the circle scene
        // add a shadow of radius 7 points
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
