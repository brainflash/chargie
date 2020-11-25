//
//  LottieView.swift
//  Chargey
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	var name: String!
	@Binding var play: Bool
	
	var animationView = AnimationView()
	
	class Coordinator: NSObject {
		var parent: LottieView
		
		init(_ animationView: LottieView) {
			self.parent = animationView
			super.init()
		}
	}
	
	func makeUIView(context: Context) -> some UIView {
		let view = UIView()

		animationView.animation = Animation.named(name)
//		animationView.animation = Animation.named(name, bundle: Bundle.main, subdirectory: "/Resources/Animations/")
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .loop
		
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(animationView)
		
		NSLayoutConstraint.activate([
			animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
			animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
		])
		
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		animationView.play()
	}

}

struct LottieView_Previews: PreviewProvider {
	static var play = Binding<Bool>.constant(true)
	
    static var previews: some View {
		LottieView(name: "36318-cat-preloader", play: play)
//			.frame(width: 300, height: 300)
    }
}
