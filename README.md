# SwiftUIMVVM

SwiftUI + MVVM + Alamofire


SwiftUI: SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.

MVVM: Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups: Models hold application data. 

Alamofire: Alamofire is an HTTP networking library written in Swift. 

Add Alamofire as swift package dependencies
https://github.com/Alamofire/Alamofire.git

Add SwiftyJSON as swift package dependencies
https://github.com/SwiftyJSON/SwiftyJSON.git

Add SDWebImage as swift package dependencies
https://github.com/SDWebImage/SDWebImageSwiftUI.git


![Image of Output]
(https://github.com/sharmadevelopers/SwiftUIMVVM/blob/master/HomeScreen.png?raw=true)

// MARK: ViewModel ContentView

struct ContentView: View {

    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView {
            List(obs.datas) { i in
                CardView(name: i.login, url: i.avatar_url)
                   }
                   .navigationBarTitle("SwiftUI : MVVM : Parser")
               }
    }
    
}



// MARK: Observer
`<
class Observer: ObservableObject {
   
   @Published var datas = [CardModel]()
    
    init() {
        
        if !Connectivity.isConnectedToInternet() {
               print("internet is not available.")
               // do some tasks..
            return;
        }
        >`
        // MARK: Network Call
        //-----------------GET Call----------------------
        //pass model to the network call - get call
        NetworkManager(data: [:], url: nil, service: .orgs, method: .get, isJSONRequest: false).executeQuery(){

                  (result: Result<[CardModel],Error>) in
                  switch result{
                  case .success(let response):
                      print(response)
                      self.datas = response;
                  case .failure(let error):
                      print(error)
                    
            }
        }
        //-----------------------------------------------------
    }
 }
 
 
 // MARK: View CardView

struct CardView: View {
    
    var name: String
    var url: String
    

    var body: some View {
        
        HStack {
            AnimatedImage(url: URL(string: url)!)
                      .resizable()
                      .frame(width: 60, height: 60)
                      .clipShape(Circle())
                      .shadow(radius: 20)
                      
            VStack(alignment: .leading) {
                Text(name).fontWeight(.heavy)
            }
        }
       
    }
    
}

 
// MARK: Model CardModel

struct CardModel : Identifiable, Codable {
    
    var id: Int
    var login: String
    var avatar_url: String
    var repos_url: String
    
}
 
 
