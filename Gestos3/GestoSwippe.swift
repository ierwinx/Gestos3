import UIKit
import Foundation

class GestoSwippe {
    
    init(direccion: UISwipeGestureRecognizer.Direction) {
        let swippe = UISwipeGestureRecognizer()
        swippe.direction = direccion
        swippe.addTarget(self, action: #selector(imprime(gesture:)))
    }
    
    @objc private func imprime(gesture: UISwipeGestureRecognizer) {
        print("se hizo swippe")
    }
    
}
