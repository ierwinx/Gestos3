import SwiftUI

struct ContentView: View {
    
    @State var cgTranslationDrag: CGSize = .zero
    @State var cgTranslationLong: CGSize = CGSize(width: 100, height: 50)
    
    @State var cgTranslationSwippe: CGSize = .zero
    
    @State var scaleValue: CGFloat = CGFloat(1)
    @State var rotationValue: Angle = .zero
    
    var body: some View {
        ScrollView {
            VStack {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .frame(height: 100)
                    .overlay(Text("Un Tap").bold().foregroundColor(.white))
                    .onTapGesture {
                        print("Se hizo tap")
                    }
                
                Spacer()
                    .frame(height: 25)
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .frame(height: 100)
                    .foregroundColor(.red)
                    .overlay(Text("Doble Tap").bold().foregroundColor(.white))
                    .onTapGesture(count: 2) {
                        print("Doble tap")
                    }
                
                Spacer()
                    .frame(height: 25)
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .frame(width: cgTranslationLong.width, height: cgTranslationLong.height)
                    .foregroundColor(.indigo)
                    .overlay(Text("Long Tap").bold().foregroundColor(.white))
                    /*.onLongPressGesture {
                        print("Long tap")
                    }*/
                    .gesture(
                        LongPressGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    cgTranslationLong = CGSize(width: 335, height: 100)
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    cgTranslationLong = CGSize(width: 100, height: 50)
                                }
                            }
                    )
                
                Spacer()
                    .frame(height: 25)
                
                VStack {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .frame(height: 100)
                        .foregroundColor(.green)
                        .overlay(Text("Pitch & Rotate").bold().foregroundColor(.white))
                        .scaleEffect(scaleValue)
                        .rotationEffect(rotationValue)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { valor in
                                    scaleValue = valor
                                }
                                .simultaneously(with:
                                    RotationGesture()
                                        .onChanged { valor in
                                            rotationValue = valor
                                        }
                                )
                        )
                    
                    Spacer()
                        .frame(height: 25)
                    
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .frame(height: 100)
                        .foregroundColor(.blue)
                        .overlay(Text("Swippe <- ->").bold().foregroundColor(.white))
                        .offset(x: cgTranslationSwippe.width, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    cgTranslationSwippe = value.translation
                                }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        cgTranslationSwippe = .zero
                                    }
                                }
                        )
                    
                    Spacer()
                        .frame(height: 25)
                    
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .frame(height: 100)
                        .foregroundColor(.purple)
                        .overlay(Text("Drag").bold().foregroundColor(.white))
                        .offset(x: cgTranslationDrag.width, y: cgTranslationDrag.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    cgTranslationDrag = value.translation
                                }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        cgTranslationDrag = .zero
                                    }
                                }
                        )
                }
                
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
