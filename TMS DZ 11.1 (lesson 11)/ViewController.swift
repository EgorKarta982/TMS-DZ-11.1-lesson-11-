
import UIKit

class ViewController: UIViewController {
    var position: Direction = .start
    var myCircle = UIView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCircle.backgroundColor = .green
        myCircle.layer.cornerRadius = myCircle.frame.width / 2
        self.view.addSubview(myCircle)
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        moveView()
    }
    
    
    func moveView(){
        UIView.animate(withDuration: 0.3) {
            self.changePosition()
        } completion: { _ in
            self.moveView()
        }
    }
    
    
    func changePosition() {
        switch position {
        case .start:
            self.myCircle.frame.origin.y += 200
            position = .down
        case .down:
            self.myCircle.frame.origin.x += 200
            position = .right
        case .right:
            self.myCircle.frame.origin.y -= 200
            position = .up
        case .up:
            self.myCircle.frame.origin.x -= 200
            position = .start
        }
    }
    
    
}

enum Direction {
    case start
    case down
    case right
    case up
}
