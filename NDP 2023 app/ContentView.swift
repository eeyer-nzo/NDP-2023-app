import SwiftUI

struct ContentView: View {
    
    struct Question {
        var question: String
        var answer: String
    }
    
    var questions = [
        Question(question: "What is the famous shopping street in SG", answer: "Orchard Road"),
        Question(question: "What is SG's national flower?", answer: "Vanda Miss Joquim"),
        Question(question: "What does NDP stand for?", answer: "National Day Parade"),
        Question(question: "Who is Singapore's Prime Minister?", answer: "Lee Hsien Loong"),
        Question(question: "Who is the President of SG", answer: "Halimah Yacob"), Question(question: "Name the reservoir in Singapore, popular for water sports activities and surrounded by nature trails", answer: "MacRitchie Resevior"), Question(question: "Name the offshore island in Singapore that is an important landfill so we all don't suffer by ChatGPT's takeover of the world.", answer: "Pulau Semakau")
    ]
    
    @State private var showButton = true
    @State private var textEntered = ""
    @State private var questionIndex = 0
    @State private var correctAns = false
    var body: some View {
        VStack {
            if showButton {
                Button(action: {
                    showButton = false
                }) {
                    Text("Click to start the game")
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .font(.largeTitle)
                        .frame(width: 250, height: 100)
                        .padding(10)
                }
            } else {
                Form {
                    Section (header: Text(questions[questionIndex].question)) {
                        TextField("Your Answer", text: $textEntered).textFieldStyle(.roundedBorder)
                    }
                    if textEntered != ""{
                        Button{
                            if  questions[questionIndex].answer == textEntered{
                                correctAns = true
                            }
                        } label: {
                            Text("Submit")
                        }
                    }
                }
            }
            if (correctAns == true) {
                Text("Correct answer!")
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

