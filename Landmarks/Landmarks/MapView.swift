//
//  MapView.swift
//  Landmarks
//
//  Created by Thy Nguyen on 8/10/21.
//  Instructed by Apple-UK Swift tutorial.
//

import SwiftUI
import MapKit // newly added

struct MapView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        // the $ means binding (a reference to the underlying value
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
