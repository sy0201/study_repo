//
//  ViewController.swift
//  BMI_sy
//
//  Created by siyeon park on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self   //뷰컨트롤러의 대리자가 될께 텍스트필드 작성시 반드시 설정할것(델리게이트 속성)
        weightTextField.delegate = self
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "키와 몸무게를 입력해주세요."
        //calculateButton.clipsToBounds = true  // radius를 줄때 반드시 이 두개긔 메서드가 사용되야함
        calculateButton.layer.cornerRadius = 5
        //calculateButton.setTitle("BMI계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요."
        weightTextField.placeholder = "kg단위로 입력해주세요."
    }
    
    
    //BMI 계산하기 - 버튼 누르면 (다음화면)
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        print(#function)
        
    }
    
    //조건에 따라 다음화면 넘어가게 할지말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(#function)
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!!"
            mainLabel.textColor = UIColor.red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    //데이터전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController   //원래 힙영역에 올라가있는 세컨드~에 인스턴스 타입으로 타입캐스팅
            secondVC.modalPresentationStyle = .fullScreen
        }
        
        let bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        
        //secondVC.bmi = bmi
        
        //다음화면으로 가기전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    // 입력하거나 (지우거나) 할때마다 (한글자 한글자 입력하는 순간마다) 호출되는 메서드
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        // "숫자"인 경우와 "지우는 경우"만 (글자입력을) 허용 하는 논리
        // (숫자로 변환이 된다면) || (지울때)
        if Int(string) != nil || string == "" {
            return true  // 글자 입력을 허용
        }
        return false  // 글자입력 허용하지 않음
    }
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
            // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
