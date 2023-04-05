
import Foundation
import UIKit
import MapKit
import AVKit
import ProgressHUD


let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

//MARK: - get SetAppLanguageCode.
func getAppLanguagesCode() -> String?{
    return  UserDefaults.standard.string(forKey: "Applanguage")
}

//MARK: - Languagecode get From Any controller.

enum LanguagesNameList : String{
    case ar = "ar"
    case id = "id"
    case hi = "hi"
    case en = "en"
    case zh = "zh-Hant"
}

extension UIStoryboard {
    enum Name: String {
        case main = "TabBar"
    }
}

//MARK: - CheckPhone is IphoneX or Not.
func isIphoneX() -> Bool {
    if( UIDevice.current.userInterfaceIdiom == .phone) {
        if(UIScreen.main.bounds.size.height >= 812) {
            return true
        }
    }
    return false
}

//MARK: -  For the log.
struct JSN {
    static var isNetworkConnected:Bool = false
    static func log(_ logMessage: String,_ args:Any... , functionName: String = #function ,file:String = #file,line:Int = #line) {
        
        let newArgs = args.map({arg -> CVarArg in String(describing: arg)})
        let messageFormat = String(format: logMessage, arguments: newArgs)
        
        print("LOG :- \(((file as NSString).lastPathComponent as NSString).deletingPathExtension)--> \(functionName) ,Line:\(line) :", messageFormat)
    }
    static func error(_ logMessage: String,_ args:Any... , functionName: String = #function ,file:String = #file,line:Int = #line) {
        
        let newArgs = args.map({arg -> CVarArg in String(describing: arg)})
        let messageFormat = String(format: logMessage, arguments: newArgs)
        
        print("ERROR :- \(((file as NSString).lastPathComponent as NSString).deletingPathExtension)--> \(functionName) ,Line:\(line) :", messageFormat)
    }
}

//MARK: - Alert and Storyboard Object.
extension UIViewController {
    static func object(_ storyboardName: UIStoryboard.Name = UIStoryboard.Name.main) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
    static func object(_ string:String,_ storyboardName: UIStoryboard.Name = UIStoryboard.Name.main) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: string) as! Self
    }
    
    static func nib() -> Self {
        return UIViewController(nibName: String(describing: Self.self), bundle: Bundle.main) as! Self
    }
    func showAlert(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

//MARK: - Controller UseFul.
extension UIViewController {
    
    func navigateToHome() {
        let frontViewController = TabBarVC()
        let frontNavigationController = UINavigationController(rootViewController: frontViewController)
        frontNavigationController.setNavigationBarHidden(true, animated: false)
        self.view.window?.rootViewController = frontNavigationController
    }
    
    func navigateToLogin() {
        let frontViewController = LoginVC()
        let frontNavigationController = UINavigationController(rootViewController: frontViewController)
        frontNavigationController.setNavigationBarHidden(true, animated: false)
        self.view.window?.rootViewController = frontNavigationController
    }
    
    var notchHeight:CGFloat {
        let window = UIApplication.shared.windows[0]
        return window.safeAreaInsets.top
//        let bottomPadding = window.safeAreaInsets.bottom
    }
    
}

//MARK: - PreviouesViewController Find And Pop.
extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        }else {
            return nil
        }
    }  
}

extension UIView {
    
    //MARK: - Circle Dashed Line.
    func addDashedCircle() {
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        circleLayer.lineWidth = 3.0
        circleLayer.strokeColor =  #colorLiteral(red: 0.8885007501, green: 0.6239523292, blue: 0.6989341378, alpha: 1) //border of circle
        circleLayer.fillColor = UIColor.clear.cgColor //inside the circle
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [2,3]
        layer.addSublayer(circleLayer)
    }
    
    //MARK: - Give DashedLine from View.
    func addDashedBorder() {
        let color = UIColor.mainColor.cgColor
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: (frameSize.width - 40)/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        self.layer.addSublayer(shapeLayer)
    }
}

//MARK: - Shadow Functionality.
extension UIView {
    func shadow(shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    func tabShadow(color:CGColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor) {
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds , cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 6
        layer0.shadowOffset = CGSize(width: 0, height: 0)
        layer0.bounds = self.bounds
        layer0.position = self.center
        layer0.backgroundColor = color
        self.layer.addSublayer(layer0)
    }
    
    
    func addShadow(_ color:CGColor = UIColor.lightGray.cgColor) {
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = color
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    func addLightShadow(_ color:CGColor = UIColor.lightGray.cgColor) {
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = color
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 8
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    func addTxtShadow(){
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 6
        layer0.shadowOffset = CGSize(width: 0, height: 0)
        layer0.bounds = self.bounds
        layer0.position = self.center
        self.layer.addSublayer(layer0)
    }
    
    func setShadowView(){
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.masksToBounds = false
        clipsToBounds = false
        layer.cornerRadius = 50
    }
}


//MARK: - Add Radiues OF View.
extension UIView{
    
    func makeTopCornerRound(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func makeBottomCornerRound(_ cornerRadius:Double = 20) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    func makeThreeReciverCornerRound(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    func makeThreeSenderCornerRound(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
    func makeLeftTopandBottomRound(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    func makeRightTopandBottomRound(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func makeTopLeft(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    func makeLeftBottom (_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner]
    }
    func makeTopRight(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    func makeRightBottom (_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    func makeLeftBottomAndTopRight(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner , .layerMaxXMinYCorner]
    }
    func makeLeftTopAndRightBottom(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMaxYCorner]
    }
    
    func makeLeftAndRightBottom(_ cornerRadius:Double = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner , .layerMaxXMaxYCorner]
    }
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}


//MARK: - Declare Global Color For App.
extension UIColor {
    static let mainColor = UIColor(named: "maincolor")!
    static let bgcolor = UIColor(named: "bgcolor")!
    static let fontGrayColor =  UIColor(named: "fontgraycolor")!
    static var placeholderGray: UIColor {
        return UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    }
}

//MARK: - Datepicker Generic Function.
extension UITextField {
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        // Code goes here
        let datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: screenWidth,
                                                    height: 216))
        datePicker.datePickerMode = datePickerMode
        datePicker.preferredDatePickerStyle = .wheels
        self.inputView = datePicker
    }
}

//MARK: - Get ViewController.

func getTopMostViewController() -> UIViewController? {
    var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
    while let presentedViewController = topMostViewController?.presentedViewController {
        topMostViewController = presentedViewController
    }
    return topMostViewController
}


extension UITextField {

  //MARK: - Set Image on the Right of TextField.
  func setupRightImage(imageName:String){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    imageView.image = UIImage(named: imageName)
    let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    imageContainerView.addSubview(imageView)
    rightView = imageContainerView
    rightViewMode = .always
    self.tintColor = .lightGray
}

   //MARK: - Set Image on Left of TextField.
    func setupLeftImage(imageName:String){
       let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
       imageView.image = UIImage(named: imageName)
       let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
       imageContainerView.addSubview(imageView)
       leftView = imageContainerView
        leftViewMode = .always
       self.tintColor = .lightGray
     }
  }

extension UIView{
    
    //MARK: - Get Parent View Controller from any view.
    func parentViewController() -> UIViewController {
        var responder: UIResponder? = self
        while !(responder is UIViewController) {
            responder = responder?.next
            if nil == responder {
                break
            }
        }
        return (responder as? UIViewController)!
    }
}


//MARK: - Manage collectionview Cell Space Like Show as Tag.
class TagsLayout: UICollectionViewFlowLayout {
    
    required override init() {super.init(); common()}
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); common()}
    
    private func common() {
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
    override func layoutAttributesForElements(
        in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            
            guard let att = super.layoutAttributesForElements(in:rect) else {return []}
            var x: CGFloat = sectionInset.left
            var y: CGFloat = -1.0
            
            for a in att {
                if a.representedElementCategory != .cell { continue }
                
                if a.frame.origin.y >= y { x = sectionInset.left }
                a.frame.origin.x = x
                x += a.frame.width + minimumInteritemSpacing
                y = a.frame.maxY
            }
            print(att)
            return att
        }
}

//MARK: - DrawDottedImage.
extension UIImageView {
    static func drawDottedImage(width: CGFloat, height: CGFloat, color: UIColor) -> UIImage {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 1.0, y: 1.0))
        path.addLine(to: CGPoint(x: width, y: 1))
        path.lineWidth = 1.5
        let dashes: [CGFloat] = [path.lineWidth, path.lineWidth * 5]
        path.setLineDash(dashes, count: 2, phase: 0)
        path.lineCapStyle = .butt
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 2)
        color.setStroke()
        path.stroke()
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

//MARK: - Custom DashedView.
class CustomDashedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0
    
    var dashBorder: CAShapeLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}

//MARK: - Set custom MarkerPin on Map.
class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    let image: UIImage?
    
    init(pinTitle:String, pinSubTitle:String,image:UIImage, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        self.image = image
        super.init()
    }
}


extension UIView{
    
    //MARK: - SetGradientColor From Any View.
    func setGradientBackground() {
        let colorTop =  UIColor.bgcolor
        let colorBottom =  UIColor.white.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.8]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}

//MARK: - Set Button Shadow and Name as Globally.
extension UIButton{
    func setButtonTitleAndFunctionality(_ Name:String, textFont:UIFont = UIFont(name: "Montserrat-Bold", size: 18)!) {
        self.setTitle(Name, for: .normal)
        self.titleLabel?.font = textFont
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 10
        self.backgroundColor = .mainColor
        self.addShadow()

        //MARK: - Addshadow.
//        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
//        let layer0 = CALayer()
//        layer0.shadowPath = shadowPath0.cgPath
//        layer0.shadowColor = UIColor(red: 0.784, green: 0.353, blue: 0.329, alpha: 0.25).cgColor
//        layer0.shadowOpacity = 1
//        layer0.shadowRadius = 6
//        layer0.shadowOffset = CGSize(width: 0, height: 0)
//        layer0.bounds = self.bounds
//        layer0.position = self.center
//        self.layer.addSublayer(layer0)
//        self.clipsToBounds = true
    }
}

//MARK: - Navigation Configration.
extension UIViewController{
    func pushVC(_ Name:UIViewController){
        let vc = Name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Dropdown confirigation

//    func dropDownConfirgration(anchorview:AnchorView?,width:CGFloat?,datasource:[String]){
//        let dropDown = DropDown()
//        dropDown.anchorView = anchorview
//        dropDown.width = width
//        dropDown.backgroundColor = .white
//        dropDown.cornerRadius = 10
//        dropDown.bottomOffset = CGPoint(x: 0, y: 35)
//        dropDown.dataSource = datasource
//        dropDown.show()
//    }
}

extension UIViewController {
    
    //MARK: - Progressbar Setup.
    func setupProgressBar(){
        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.colorAnimation = UIColor.mainColor
        ProgressHUD.colorProgress = UIColor.mainColor
        ProgressHUD.colorStatus = UIColor.mainColor
        ProgressHUD.colorBackground = #colorLiteral(red: 0.04705882353, green: 0.06666666667, blue: 0.05098039216, alpha: 1)
        ProgressHUD.fontStatus = UIFont(name: "Montserrat-Bold", size: 18)!
    }
    
    //MARK: - ShowToast Message.
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

//MARK: - CheckAuthentication USeful.
extension String{
    
    func IsValidphone() -> Bool {
        let phoneRegEx = "[0-9]{10}"
        return applyPredictOnRange(regRgx: phoneRegEx)
    }
    func IsvalidPassword()->Bool{
        let passwordRgx = "[A-Z]{1,2}+[a-z]{3,9}+[@&$]{1}+[0-9]{1,4}"
        return applyPredictOnRange(regRgx: passwordRgx)
    }
    func applyPredictOnRange(regRgx : String)->Bool {
        let trimmerstring = self.trimmingCharacters(in: .whitespaces)
        let phonetest = NSPredicate(format: "SELF MATCHES %@", regRgx)
        let invalidstring = phonetest.evaluate(with:trimmerstring)
        return invalidstring
    }
    func IsValidOtp() -> Bool{
        let phoneRegEx = "[0-9]{10}"
        return applyPredictOnRange(regRgx: phoneRegEx)
    }
}

//MARK: - CreatboderLine Of View.
extension UIView {
   func createDottedLine(width: CGFloat, color: CGColor) {
      let caShapeLayer = CAShapeLayer()
      caShapeLayer.strokeColor = color
      caShapeLayer.lineWidth = width
      caShapeLayer.lineDashPattern = [2,3]
      let cgPath = CGMutablePath()
      let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width - 25, y: 0)]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
      layer.addSublayer(caShapeLayer)
   }
}

//MARK: - Share AppLink.
extension UIViewController{
    func share(message: String, link: String) {
        if let link = NSURL(string: link) {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            getTopMostViewController()?.present(activityVC, animated: true, completion: nil)
        }
    }
}

//MARK: - GetparentView From View.
extension UIView {
    func parentView<T: UIView>(of type: T.Type) -> T? {
        guard let view = superview else {
            return nil
        }
        return (view as? T) ?? view.parentView(of: T.self)
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return parentView(of: UITableView.self)
    }
}

//MARK: - Change StatusBar Color.

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: - Change textField placeholder Color.
extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
}

//MARK: - view set Gradient Color.
extension UIView{
    func AddGraientColorLayerForView() {
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.749, green: 0.353, blue: 0.878, alpha: 1).cgColor,
            UIColor(red: 0.659, green: 0.067, blue: 0.855, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        layer0.position = self.center
        self.layer.addSublayer(layer0)
    }
}

//MARK: - AddDashedline vertical And Horizontal.

extension UIView {
    enum dashedOrientation {
        case horizontal
        case vertical
    }
    
    func makeDashedBorderLine(color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat, orientation: dashedOrientation) {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        if orientation == .vertical {
            path.addLines(between: [CGPoint(x: bounds.midX, y: bounds.minY),
                                    CGPoint(x: bounds.midX, y: bounds.maxY)])
        } else if orientation == .horizontal {
            path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.midY),
                                    CGPoint(x: bounds.maxX, y: bounds.midY)])
        }
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}

//MARK: - line upon Label.

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
    
    func RemoveStrikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        return attributeString
    }
}
