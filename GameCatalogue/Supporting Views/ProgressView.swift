//
//  ProgressView.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 27/12/20.
//

import SwiftUI

struct ProgressView: View {
    
    var placeHolder: String
    @Binding var show: Bool
    @State var animate = false
    
    var body: some View {
        VStack(spacing: 28) {
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [Color.primary, Color.primary.opacity(0)]), center: .center))
                .frame(width: 60, height: 60)
                // animate
                .rotationEffect(.init(degrees: animate ? 360 : 0))
            
            Text(placeHolder)
                .fontWeight(.regular)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(BlurView())
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35)
                .onAppear {
                    withAnimation {
                        // closing view
                        let seconds = 2.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                            show.toggle()
                        }
                    }
                })
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                animate.toggle()
            }
        }
    }
}

struct BlurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}

//struct ProgressView_Previews: PreviewProvider {
//    @State var showProgress = false
//    static var previews: some View {
//        ProgressView(placeHolder: "Load Data", show: $showProgress)
//    }
//}
