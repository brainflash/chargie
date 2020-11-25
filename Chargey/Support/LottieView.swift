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
	
	@State var playState: Bool = false
	/// The animation name
	@Binding var name: String
	/// Animation will play when true
	@Binding var play: Bool
	
	var animationView = AnimationView()
	
	class Coordinator: NSObject {
		var parent: LottieView
		
		init(_ animationView: LottieView) {
			self.parent = animationView
			super.init()
		}
	}
	
	func initAnimation() {
		animationView.animation = Animation.named(name)
		// TODO: arrange these into groups
//		animationView.animation = Animation.named(name, bundle: Bundle.main, subdirectory: "/Resources/Animations/")
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .loop
	}
	
	func makeUIView(context: Context) -> some UIView {
		print ("makeUIView")
		let view = UIView()
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		uiView.subviews.forEach({ $0.removeFromSuperview() })
		
		print ("updateUIView")
		
		let animationView = AnimationView()
		animationView.translatesAutoresizingMaskIntoConstraints = false
		uiView.addSubview(animationView)

		NSLayoutConstraint.activate([
			animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
			animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
		])

		animationView.animation = Animation.named(name)
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .loop
		animationView.play()
	}
	
/*
	func makeUIView(context: Context) -> some UIView {
		let view = UIView()

		initAnimation()
//		animationView.play()
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(animationView)
		
		NSLayoutConstraint.activate([
			animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
			animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
		])
		
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		// TODO: does the 'play' var above do anything? Needs testing...

//		initAnimation()
		if self.play {
			if animationView.animation == nil {
				animationView.animation = Animation.named(name)
			}
//			if self.playState == false {
				print ("LottieView play")
				animationView.play()
//				self.playState = true
//			}
//			self.playAnimation()
		} else {
			print ("LottieView stop")
//			self.playState = false
//			animationView.stop()
//			self.stop()
		}
	}
*/

}

extension LottieView {
	
	func playAnimation() {
//		guard self.playState == false else { return }
//		animationView.play()
//		self.playState = true
	}
	
	func stop() {
//		guard self.playState == true else { return }
//		animationView.stop()
//		self.playState = false
	}

}

struct LottieView_Previews: PreviewProvider {
	static var name = Binding<String>.constant("36318-cat-preloader")
	static var play = Binding<Bool>.constant(true)
	
    static var previews: some View {
		LottieView(name: name, play: play)
//			.frame(width: 300, height: 300)
    }

}
