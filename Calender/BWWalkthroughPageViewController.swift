

import UIKit

public enum WalkthroughAnimationType:String{
    case Linear = "Linear"
    case Curve = "Curve"
    case Zoom = "Zoom"
    case InOut = "InOut"
    
    init(_ name:String){
        
        if let tempSelf = WalkthroughAnimationType(rawValue: name){
            self = tempSelf
        }else{
            self = .InOut
        }
    }
}


open class BWWalkthroughPageViewController: UIViewController, BWWalkthroughPage {
    
    
    
    var window: UIWindow?

    
    @IBAction func startbt(_ sender: Any) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllertabBar")

        let navigationController = UINavigationController(rootViewController: vc!)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont(name: "DroidArabicKufi", size: 20)!]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        //self.present(vc!, animated: true, completion: nil)
        

//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        appDelegate.window?.rootViewController = vc
//        appDelegate.window?.makeKeyAndVisible()
      //  let nav = UINavigationController(rootViewController: ViewController)
      //  appDelegate.window!.rootViewController = nav
        
        
        //AppDelegate.setHomewVC()
        //appdelegate.window.rootview
        
        
    }
    
    
    private var animation:WalkthroughAnimationType = .InOut
    private var subviewsSpeed:[CGPoint] = Array()
    private var notAnimatableViews:[Int] = [] // Array of views' tags that should not be animated during the scroll/transition
    
    // MARK: Inspectable Properties
    // Edit these values using the Attribute inspector or modify directly the "User defined runtime attributes" in IB
    
    
    
    @IBInspectable var speed:CGPoint = CGPoint(x: 0.0, y: 0.0);            // Note if you set this value via Attribute inspector it can only be an Integer (change it manually via User defined runtime attribute if you need a Float)
    @IBInspectable var speedVariance:CGPoint = CGPoint(x: 0.0, y: 0.0)     // Note if you set this value via Attribute inspector it can only be an Integer (change it manually via User defined runtime attribute if you need a Float)
    @IBInspectable var animationType:String {
        set(value){
            self.animation = WalkthroughAnimationType(rawValue: value)!
        }
        get{
            return self.animation.rawValue
        }
    }
    @IBInspectable var animateAlpha:Bool = false
    @IBInspectable var staticTags:String {                                 // A comma separated list of tags that you don't want to animate during the transition/scroll 
        set(value){
            self.notAnimatableViews = value.components(separatedBy: ",").map{Int($0)!}
        }
        get{
            return notAnimatableViews.map{String($0)}.joined(separator: ",")
        }
    }
    
    // MARK: BWWalkthroughPage Implementation

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.masksToBounds = true
        subviewsSpeed = Array()
        
        for v in view.subviews{
            speed.x += speedVariance.x
            speed.y += speedVariance.y
            if !notAnimatableViews.contains(v.tag) {
                subviewsSpeed.append(speed)
            }
        }
    }
    
    open func walkthroughDidScroll(to: CGFloat, offset: CGFloat) {
        
        for i in 0 ..< subviewsSpeed.count{
            
            // Perform animations
            switch animation{
                
            case .Linear:
                animationLinear(i, offset)
                
            case .Zoom:
                animationZoom(i, offset)
                
            case .Curve:
                animationCurve(i, offset)
                
            case .InOut:
                animationInOut(i, offset)
            }
            
            // Animate alpha
            if(animateAlpha){
                animationAlpha(i, offset)
            }
        }
    }

    // MARK: Animations
    
    private func animationAlpha(_ index:Int, _ offset:CGFloat) {
        let cView = view.subviews[index]
        var mutableOffset = offset
        if(mutableOffset > 1.0){
            mutableOffset = 1.0 + (1.0 - mutableOffset)
        }
        cView.alpha = (mutableOffset)
    }
    
    private func animationCurve(_ index:Int, _ offset:CGFloat) {
        var transform = CATransform3DIdentity
        let x:CGFloat = (1.0 - offset) * 10
        transform = CATransform3DTranslate(transform, (pow(x,3) - (x * 25)) * subviewsSpeed[index].x, (pow(x,3) - (x * 20)) * subviewsSpeed[index].y, 0 )
        applyTransform(index, transform: transform)
    }
    
    private func animationZoom(_ index:Int, _ offset:CGFloat){
        var transform = CATransform3DIdentity

        var tmpOffset = offset
        if(tmpOffset > 1.0){
            tmpOffset = 1.0 + (1.0 - tmpOffset)
        }
        let scale:CGFloat = (1.0 - tmpOffset)
        transform = CATransform3DScale(transform, 1 - scale , 1 - scale, 1.0)
        applyTransform(index, transform: transform)
    }
    
    private func animationLinear(_ index:Int, _ offset:CGFloat) {
        var transform = CATransform3DIdentity
        let mx:CGFloat = (1.0 - offset) * 100
        transform = CATransform3DTranslate(transform, mx * subviewsSpeed[index].x, mx * subviewsSpeed[index].y, 0 )
        applyTransform(index, transform: transform)
    }
    
    private func animationInOut(_ index:Int, _ offset:CGFloat) {
        var transform = CATransform3DIdentity
        
        var tmpOffset = offset
        if(tmpOffset > 1.0){
            tmpOffset = 1.0 + (1.0 - tmpOffset)
        }
        transform = CATransform3DTranslate(transform, (1.0 - tmpOffset) * subviewsSpeed[index].x * 100, (1.0 - tmpOffset) * subviewsSpeed[index].y * 100, 0)
        applyTransform(index, transform: transform)
    }
    
    private func applyTransform(_ index:Int, transform:CATransform3D){
        let subview = view.subviews[index]
        if !notAnimatableViews.contains(subview.tag){
            view.subviews[index].layer.transform = transform
        }
    }
}
