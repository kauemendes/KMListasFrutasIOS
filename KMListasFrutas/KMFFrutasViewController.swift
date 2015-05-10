//
//  KMFFrutasViewController.swift
//  KMListasFrutas
//
//  Created by Kaue Mendes on 3/26/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

protocol KMFFrutasViewControllerDelegate:class{
    
    func frutaFavorito(indiceFruta:Int, isfavorito: Bool)
    
}

class KMFFrutasViewController: UIViewController {

    @IBOutlet weak var txtNameFruta: UILabel!
    @IBOutlet weak var imgFrutaGr: UIImageView!
    @IBOutlet weak var switchFavorite: UISwitch!
    
    weak var delegate: KMFFrutasViewControllerDelegate?
    
    var nameFruta : String = ""
    var isFavorited : Bool = false
    var imgFruta : String = ""
    var indexFruta = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNameFruta.text = nameFruta
        switchFavorite.on = isFavorited
        imgFrutaGr.image = UIImage(named: "abacaxi")
        if( imgFruta != "" ) {
            imgFrutaGr.image = UIImage(named: imgFruta.lowercaseString )
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func marcarFavorito(sender: AnyObject) {
        delegate?.frutaFavorito(indexFruta, isfavorito: switchFavorite.on)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
