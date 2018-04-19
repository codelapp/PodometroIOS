import UIKit
import CoreMotion
class ViewController: UIViewController {
    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var pasos: UILabel!
    @IBOutlet weak var distancia: UILabel!
    
    var numeroPasos = 0
    var distanciaMetros = 0.0
    var podometro = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func iniciar(_ sender: UIButton) {
        titulo.text = "INICIADO"
        podometro.startUpdates(from: Date()) { (podometroDatos, error) in
            if let registro = podometroDatos {
                self.numeroPasos = Int(truncating: registro.numberOfSteps)
                if let distance = registro.distance {
                    self.distanciaMetros = Double(truncating: distance)
                }
            }else{
                self.numeroPasos = 0
                self.distanciaMetros = 0.0
            }
        }
    }
    
    @IBAction func detener(_ sender: UIButton) {
        podometro.stopUpdates()
        titulo.text = "DETENIDO"
        pasos.text = "Pasos caminados: \(numeroPasos)"
        distancia.text = String(format:"Distancia: %02.02f metros", distanciaMetros)
    }
    
    @IBAction func reiniciar(_ sender: UIButton) {
        self.numeroPasos = 0
        self.distanciaMetros = 0.0
        titulo.text = "PODOMETRO"
        pasos.text = "PASOS"
        distancia.text = "DISTANCIA"
    }
    
}











