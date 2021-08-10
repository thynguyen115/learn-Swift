//
//  ContentView.swift
//  Landmarks
//
//  Created by Thy Nguyen on 8/9/21.
//  Instructed by Apple-UK Swift tutorial.
//
//  Additional files inside: CreatingAndCombiningViews folder (downloaded on 8/10/21).
//

import SwiftUI

// struct: View
// Describe the view's content and layout
struct ContentView: View {
    var body: some View {
        // VStack(alignment: .leading) ...
        // to align the views by the leading edges
        VStack {
            // the below MapView is from MapView.swift
            // Add a custom MapView
            // with the frame(width:height:)
            // if not specify width, the view sizes to the width of its content
            // ignoreSafeArea allows the map content extending to top of edge screen
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            // CircleImage() is from CircleImage.swift
            // However, the titles are covered ==> adjust the offset and padding
            // offset: -130 points vertically
            // padding: -130 points from the bbottom of the view
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Vertical Stack
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.green) // it will be a black text if remove this
                
                HStack {
                    // create the following text by choosing Text from [+] button on the right
                    Text("Joshua Tree National Park").font(.subheadline) // set font to "subheadline"
                    Spacer() // to separate the text and use the whole width of the device
                    Text("California").font(.subheadline)
                }
                
                Divider() // divider bw texts
                
                // Add subtitle
                Text("About Turtle Rock").font(.title3).fontWeight(.light)
                Text("View more").font(.subheadline).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) // more description
                
            }.padding()
            Spacer() // push the content upward
        }
    }
}

// struct: ContentView_Previews:
// Declare a preview for that view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
