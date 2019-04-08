import UIKit
import PlaygroundSupport
import AVFoundation

class ButtonViewController : UINavigationController {
    var button0 : UIButton!
    var button1 : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!
    var button4 : UIButton!
    var button5 : UIButton!
    var button6 : UIButton!
    var button7 : UIButton!
    var button8 : UIButton!
    var button9 : UIButton!
    var buttonGuitar : UIButton!
    var buttonPiano : UIButton!
    var sequencia : UILabel!
    var Note_sound1: AVAudioPlayer?
    var Note_sound2: AVAudioPlayer?
    var Note_sound3: AVAudioPlayer?
    var Note_sound4: AVAudioPlayer?
    var Note_sound5: AVAudioPlayer?
    var Note_sound6: AVAudioPlayer?
    var Note_sound7: AVAudioPlayer?
    
    
    var width:CGFloat = 480
    var height:CGFloat = 640
    
    var numeroAtualFibonacci = 2
    var numeroAnteriorFibonacci = 1
    var numeroDoisAtras = 1
    var accFibonacci = 0
    var NumberUpdate = 0
    
    
    
    override func loadView() {
        
        width = UIScreen.main.bounds.width  / 2
        height = UIScreen.main.bounds.height / 2
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let imagemFundo = UIImage(named: "branco_fibonacci.png")
        let imagemFundoView = UIImageView(image: imagemFundo)
        //        imagemFundoView.frame = CGRect(x:-4, y: 0, width: width-10, height: height )
        v.addSubview(imagemFundoView)
        imagemFundoView.translatesAutoresizingMaskIntoConstraints = false
        imagemFundoView.leftAnchor.constraint(equalTo: v.leftAnchor , constant: -4).isActive = true
        imagemFundoView.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
        imagemFundoView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imagemFundoView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        self.view = v
        

        let button_size = width/7
        
        
        sequencia = UILabel()
        sequencia.text = "\(numeroDoisAtras) + \(numeroAnteriorFibonacci) = \(numeroAtualFibonacci)"
        
        sequencia.font = UIFont(name: "Arial", size: 50.0)
        sequencia.adjustsFontSizeToFitWidth = true
        sequencia.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sequencia.text
        sequencia.frame = CGRect(x:-3, y:210, width:width, height:75)
        v.addSubview(sequencia)
        
        
        
        
        
        
        //button parametres
        button0 = UIButton(type: .system)
        button0.setTitle("\n0", for: .normal)
        button0.titleLabel?.numberOfLines = 2
        button0.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button0.titleLabel?.font
        button0.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button0.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button0.contentVerticalAlignment = .center
        button0.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button0.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        button0.layer.cornerRadius = 10
        button0.tag = 0
        v.addSubview(button0)
        //auto layout
        button0.translatesAutoresizingMaskIntoConstraints = false
        button0.leftAnchor.constraint(equalTo: v.leftAnchor).isActive = true
        button0.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button0.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button0.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        //--
        
        
        
        
        button2 = UIButton(type: .system)
        button2.setTitle("\n2", for: .normal)
        button2.titleLabel?.numberOfLines = 2
        button2.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button2.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button2.contentVerticalAlignment = .center
        button2.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button2.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button2.frame = CGRect(x: button_size, y: height, width: button_size, height: height/3)
        button2.layer.cornerRadius = 10
        button2.tag = 2
        v.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size).isActive = true
        button2.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button2.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button2.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        
        button1 = UIButton(type: .system)
        button1.setTitle("1", for: .normal)
        button1.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button1.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button1.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button1.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button1.contentVerticalAlignment = .center
        button1.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button1.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button1.frame = CGRect(x: (button_size)/2, y: height, width: button_size, height: (height/3)/2-10)
        button1.layer.cornerRadius = 10
        button1.tag = 1
        v.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size / 2 ).isActive = true
        button1.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -(((height/3)/2+10) + 100)).isActive = true
        button1.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button1.heightAnchor.constraint(equalToConstant: (height/3)/2-10).isActive = true
        
        
        button3 = UIButton(type: .system)
        button3.setTitle("\n3", for: .normal)
        button3.titleLabel?.numberOfLines = 2
        button3.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button3.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button3.contentVerticalAlignment = .center
        button3.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button3.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button3.frame = CGRect(x: button_size*2, y: height, width: button_size, height: (height/3))
        button3.layer.cornerRadius = 10
        button3.tag = 3
        v.addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size * 2).isActive = true
        button3.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button3.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button3.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        
        
        
        
        button5 = UIButton(type: .system)
        button5.setTitle("\n5", for: .normal)
        button5.titleLabel?.numberOfLines = 2
        button5.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button5.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button5.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button5.contentVerticalAlignment = .center
        button5.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button5.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button5.frame = CGRect(x: (button_size*3), y: height, width: button_size, height: (height/3))
        button5.layer.cornerRadius = 10
        button5.tag = 5
        v.addSubview(button5)
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size * 3).isActive = true
        button5.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button5.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button5.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        
        
        
        
        button4 = UIButton(type: .system)
        button4.setTitle("4", for: .normal)
        button4.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button4.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button4.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button4.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button4.contentVerticalAlignment = .center
        button4.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        //        button4.frame = CGRect(x: (button_size/2)+(button_size*2), y: height, width: button_size, height: (height/3)/2-10)
        button4.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        button4.layer.cornerRadius = 10
        button4.tag = 4
        v.addSubview(button4)
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.leftAnchor.constraint(equalTo: v.leftAnchor, constant: (button_size * 2) + (button_size / 2) ).isActive = true
        button4.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -(((height/3)/2+10) + 100)).isActive = true
        button4.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button4.heightAnchor.constraint(equalToConstant: (height/3)/2-10).isActive = true
        
        
        
        
        
        
        button6 = UIButton(type: .system)
        button6.setTitle("\n6", for: .normal)
        button6.titleLabel?.numberOfLines = 2
        button6.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button6.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button6.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button6.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button6.contentVerticalAlignment = .center
        button6.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button6.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button6.frame = CGRect(x: button_size * 4, y: height, width: button_size , height: (height/3))
        button6.layer.cornerRadius = 10
        button6.tag = 6
        v.addSubview(button6)
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size * 4).isActive = true
        button6.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button6.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button6.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        
        
        button8 = UIButton(type: .system)
        button8.setTitle("\n8", for: .normal)
        button8.titleLabel?.numberOfLines = 2
        button8.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button8.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button8.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button8.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button8.contentVerticalAlignment = .center
        button8.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button8.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button8.frame = CGRect(x: button_size * 5, y: height, width: button_size, height: (height/3))
        button8.layer.cornerRadius = 10
        button8.tag = 8
        v.addSubview(button8)
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size * 5).isActive = true
        button8.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button8.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button8.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        button7 = UIButton(type: .system)
        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button7.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button7.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button7.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button7.contentVerticalAlignment = .center
        button7.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button7.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button7.frame = CGRect(x: (button_size/2)+(button_size*4), y: height, width: button_size, height: (height/3)/2-10)
        button7.layer.cornerRadius = 10
        button7.tag = 7
        v.addSubview(button7)
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.leftAnchor.constraint(equalTo: v.leftAnchor, constant: (button_size * 4) + (button_size / 2) ).isActive = true
        button7.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -(((height/3)/2+10) + 100)).isActive = true
        button7.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button7.heightAnchor.constraint(equalToConstant: (height/3)/2-10).isActive = true
        
        
        
        
        
        
        button9 = UIButton(type: .system)
        button9.setTitle("\n9", for: .normal)
        button9.titleLabel?.numberOfLines = 2
        button9.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        button9.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button9.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button9.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button9.contentVerticalAlignment = .center
        button9.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        button9.addTarget(self, action: #selector(fibonacci), for: .touchUpInside)
        //        button9.frame = CGRect(x: button_size*6, y: height, width: button_size, height: (height/3))
        button9.layer.cornerRadius = 10
        button9.tag = 9
        v.addSubview(button9)
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.leftAnchor.constraint(equalTo: v.leftAnchor, constant: button_size * 6).isActive = true
        button9.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -100).isActive = true
        button9.widthAnchor.constraint(equalToConstant: button_size).isActive = true
        button9.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        
        
        
    }
    @objc func playsound(sender:UIButton) {
        
        
        let sounds:[String] = ["sound_0_dub.mp3",
                               "sound_1_dub.mp3",
                               "sound_2_dub.mp3",
                               "sound_3_dub.mp3",
                               "sound_4_dub.mp3",
                               "sound_5_dub.mp3",
                               "sound_6_dub.mp3",
                               "sound_7_dub.mp3",
                               "sound_8_dub.mp3",
                               "sound_9_dub.mp3"]
        
        
        let path = Bundle.main.path(forResource: sounds[sender.tag], ofType:nil)!
        
        let url = URL(fileURLWithPath: path)
        
        do {
            if (Note_sound1?.isPlaying != true){
            Note_sound1 = try AVAudioPlayer(contentsOf: url)
            Note_sound1?.play()
                }
            else if (Note_sound2?.isPlaying != true){
                Note_sound2 = try AVAudioPlayer(contentsOf: url)
                Note_sound2?.play()
            }
            else if(Note_sound3?.isPlaying != true){
                Note_sound3 = try AVAudioPlayer(contentsOf: url)
                Note_sound3?.play()
            }
            else if(Note_sound4?.isPlaying != true){
                Note_sound4 = try AVAudioPlayer(contentsOf: url)
                Note_sound4?.play()
            }

            else if(Note_sound5?.isPlaying != true){
                Note_sound5 = try AVAudioPlayer(contentsOf: url)
                Note_sound5?.play()
            }
            else if(Note_sound6?.isPlaying != true){
                Note_sound6 = try AVAudioPlayer(contentsOf: url)
                Note_sound6?.play()
            }

            else if(Note_sound7?.isPlaying != true){
                Note_sound7 = try AVAudioPlayer(contentsOf: url)
                Note_sound7?.play()
            }

        }catch {
            // couldn't load file :(
            print("problem with AV Audio Player")
            }
        
    }
    
    @objc func fibonacci(){
        
        var helper = String(numeroAtualFibonacci)
        var acc = helper.count
        NumberUpdate = NumberUpdate + 1
        NumberUpdate
        if NumberUpdate == acc {
            accFibonacci = numeroAtualFibonacci
            
            numeroAtualFibonacci = numeroAnteriorFibonacci + numeroAtualFibonacci
            numeroDoisAtras = numeroAnteriorFibonacci
            numeroAnteriorFibonacci = accFibonacci
            sequencia.text = "\(numeroDoisAtras) + \(numeroAnteriorFibonacci) = \(numeroAtualFibonacci)"
            NumberUpdate = 0
        }}
}










PlaygroundPage.current.liveView = ButtonViewController()
