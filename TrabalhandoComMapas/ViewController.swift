//
//  ViewController.swift
//  TrabalhandoComMapas
//
//  Created by Felipe Augusto Correia on 03/02/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var mapa: MKMapView!
    
    var gerenciadorDeLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Precisão de localização
        gerenciadorDeLocal.desiredAccuracy = kCLLocationAccuracyBest
        // Delegate
        gerenciadorDeLocal.delegate = self
        // Pedir autorização ao usuário
        gerenciadorDeLocal.requestWhenInUseAuthorization()
        // Começar a atualizar a localizaçao do usuário na tela
        gerenciadorDeLocal.startUpdatingLocation()
        

//        // Cria um PIN no local
//        let anotacao = MKPointAnnotation()
//        anotacao.coordinate = localizacao
//        anotacao.title = "Etec Zona Leste"
//        mapa.addAnnotation(anotacao)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        //Faz com que o usuário vá ate algum local
        // Localização -> Minha localizaçao está recebendo sempre os dados da ultima localização e atualizando
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude

        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)


        // Zoom
        let latitudeDelta: CLLocationDegrees = 0.01
        let longitudeDelta: CLLocationDegrees = 0.01

        let visualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)


        // Região -> zoom + localização
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: visualizacao)


        // Seta a região no mapa
        mapa.setRegion(regiao, animated: true)
    }
}

