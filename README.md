# SwiftUI_SocialLogin

## Google Social Login

### Before U Begin

1) Added Firebase in iOS Project.   
iOS 프로젝트에 모듈추가
```
pod ‘Firebase/Auth’
pod ‘GoogleSignIn’
```

2) If you have not yet connected the app to your Firebase project, connect it from the Firebase Console.   
Firebase에 앱을 연결

3) In the Firebase Console, open the Authentication section.   
Firebase Console의 인증 섹션 열기
<br>
On the Login Methods tab, enable the Google login method and click Save.   
로그인 방법에서 구글 로그인 방법을 사용 설정  
<br>

***

### Import Header / 헤더 임포트
AppDelegate.swift
```swift
import Firebase
import GoogleSignIn
```

ContentView.swift 
```swift
import Firebase
import GoogleSignIn
```
***

### Google Login 
1) Click project name in navigator. select the Information tab, and expand the URL Type section.  
왼쪽 네비게이터의 프로젝트 이름을 클릭. 정보 탭에서 URL Type 부분을 클릭
2) Click the + button and add the URL schema for the inverted client ID.  
+ 버튼을 눌러 URL schema에 클라이언트 ID 넣기
3) To find this value, open the GoogleService-Info.list configuration file and locate the REVERSED_CLIENT_ID key. Copy and paste the value of this key into the URL schema box.  
GoogleService-Info.list 파일에 REVERSED_CLIENT_ID 키를 찾아 복사/붙혀넣기
4) AppDelegate.swift
```swift
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Firebase 설정
        FirebaseApp.configure()
        
        //Google 로그인 설정
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {    return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            //...
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential){
            (user, error) in
            if error != nil {
                return
            }
        }
    }
}
```

***

### LoginView

1) SocialLogin struct
```swift
struct SocialLogin: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
    }

    static func attemptLoginGoogle(){
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
}
```

2) Login Button
```swift
var body: some View {
        HStack{
            VStack{
                Button(action: SocialLogin.attemptLoginGoogle,label: {
                        Image("google").frame(width: 20, height: 20)
                })
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(Color.white)
                    .cornerRadius(8.0)
                    .shadow(radius: 4.0)
            }
        }
    }
```

## Facebook Login

** To be Written ** 

    
