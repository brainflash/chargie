//
//  ContentView.swift
//  Chargey
//
//  Created by Brainflash on 24/11/2020.
//

import SwiftUI

struct ContentView: View {
	@State var play = false
	
    var body: some View {
		VStack {
			LottieView(name: "36318-cat-preloader", play: $play)
				.frame(width: 300, height: 300)
			Button("Play") { self.play.toggle() }
		}
		.
		.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
