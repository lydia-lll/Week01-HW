//: [Previous](@previous)

import SwiftUI

struct ContentView: View {
    var emojis = ["đĒŦ","âī¸","âī¸","đģ","â¨ī¸","đ˛ī¸","đšī¸","đŊ","đž","đˇ","đĨ","đī¸","đ","âī¸","đ ","đē","đ§­","â°","âī¸","đĄ","đ","đĄ","đ°","đ"]
    @State var emojiCount = 2
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Cardview(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()

        
    }
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }label: {
            Image(systemName: "plus.app")
        }
    }
    var remove: some View{
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        }label: {
            Image(systemName: "minus.square")
        }
    }
}

struct Cardview: View{
    var content: String
    @State var isFaceUp =  false
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder()
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
           
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


//: [Next](@next)
