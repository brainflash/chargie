//
//  ExitButton.swift
//  Chargie
//
//  Created by Brainflash on 03/12/2020.
//

import SwiftUI

typealias ExitButtonHandler = (() -> Void)

struct ExitButton: View {
	@EnvironmentObject private var model: AppModel
	@Binding var isOn: Bool
	var fadeOut: Bool = true
	var handler: ExitButtonHandler
	
	var body: some View {
		if isOn {
			Button(action: {
				handler()
			}) {
				Image(systemName: "xmark.circle")
					.renderingMode(.template)
					.foregroundColor(.white)
					.font(.largeTitle)
					.opacity(0.7)
			}
			.padding()
			.onAppear(perform: {
				startTimer()
			})
		}
	}
	
	func startTimer() {
		if fadeOut && isOn {
			Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
				isOn = false
			}
		}
	}
}

struct ExitButton_Previews: PreviewProvider {
	static var isOn = Binding<Bool>.constant(true)
	
    static var previews: some View {
		ExitButton(isOn: isOn, handler: {})
    }
}
