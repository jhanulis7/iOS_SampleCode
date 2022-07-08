//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 7012618 on 2022/07/05.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var computerBallCountLvl: UILabel!
    @IBOutlet weak var userBallCountLvl: UILabel!
    @IBOutlet weak var resultLvl: UILabel!
    
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLvl.text = String(comBallCount)
        userBallCountLvl.text = String(userBallCount)
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임시작")
        print(getRandom())
        let alert = UIAlertController.init(title: "GAME START", message: "홀 짝을 선택해주세요", preferredStyle: .alert)

        let oddButton = UIAlertAction.init(title: "홀", style: .default) { _ in
            print("홀 눌렀습니다.")

            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                print("값이 없어 취소합니다.")
                return
            }
            print("입력값 \(value)")
            self.getWinner(count: value, select: "홀")

        }
        let evenButton = UIAlertAction.init(title: "짝", style: .default) {_ in
            print("짝 눌렀습니다.")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                print("값이 없어 취소합니다.")
                return
            }
            print("입력값 \(value)")
            self.getWinner(count: value, select: "짝")
        }

        alert.addTextField { textField in
            textField.placeholder = "베팅할 구슬의 개수를 입력해주세요"
        }
        alert.addAction(oddButton)
        alert.addAction(evenButton)
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        }
    }
    
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
    
    func getWinner(count: Int, select: String) {
        let computer = getRandom()
        let computerType = computer % 2 == 0 ? "짝" : "홀"

        
        var result = computerType
        if (select == computerType) {
            result = "\(result) User Win"
            calculatorValue(count: count, winner: "User")
        } else {
            result = "\(result) Computer Win"
            calculatorValue(count: count, winner: "Computer")
        }
        print("result")
        resultLvl.text = result
    }
    
    func calculatorValue(count: Int, winner: String) {
        if (winner == "Computer") {
            self.userBallCount -= count
            self.comBallCount += count
        } else {
            self.comBallCount -= count
            self.userBallCount += count
        }
        computerBallCountLvl.text = String(comBallCount)
        userBallCountLvl.text = String(userBallCount)
    }
    
    
    //viewContoller 에 화면이 나타나고 나서 호출되어짐.
    //UI Animation, Sound 등 업데이트 할때 사용함
    override func viewWillAppear(_ animated: Bool) {
        print("뷰가 나타날것입니다.")
    }
    
    
    //viewController 가 데이타와 다 연동되고나서 호출되어짐.
    override func viewDidAppear(_ animated: Bool) {
        print("뷰가 나타났습니다.")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("뷰가 사라졌습니다")
    }

    //백그라운드전 들어가기전에 호출되어짐. 작업 저장
    override func viewWillDisappear(_ animated: Bool) {
        print("뷰가 사라질것입나다")
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier:"SecondViewController") as SecondViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

