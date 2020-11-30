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
	/// The Chargie (object containing view & theme settings)
	@ObservedObject var chargie: Chargie
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

		// TODO: arrange animation files into resource subfolders:
		// 			Chargies/Animations/

		let path = Bundle.main.bundlePath.appending("/Chargies/Animations/\(chargie.id).json")
		animationView.animation = Animation.filepath(path)
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .loop
		animationView.play()
		animationView.animationSpeed = chargie.speed
	}
}

//extension LottieView {
//
//	func playAnimation() {
//		guard self.playState == false else { return }
//		animationView.play()
//		self.playState = true
//	}
//
//	func stop() {
//		guard self.playState == true else { return }
//		animationView.stop()
//		self.playState = false
//	}
//
//}

struct LottieView_Previews: PreviewProvider {
	//	"39701-robot-bot-3d"
	static var chargie: Chargie = .racing
	static var name = Binding<String>.constant("33534-merry-christmas")
	static var play = Binding<Bool>.constant(true)
	
    static var previews: some View {
		LottieView(chargie: chargie, name: name, play: play)
//			.frame(width: 300, height: 300)
    }

}
