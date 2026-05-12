import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var imgBmi: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBAction func calcBmi(_ sender: UIButton) {
        guard let heightText = txtHeight.text, !heightText.isEmpty,
              let weightText = txtWeight.text, !weightText.isEmpty else {
            lblResult.textColor = .systemRed
            lblResult.backgroundColor = .clear
            lblResult.numberOfLines = 1
            lblResult.text = "키와 체중을 입력하세요."
            
            commentLabel.text = "키와 체중을 먼저 입력해 주세요."
            return
        }

        guard let height = Double(heightText),
              let weight = Double(weightText),
              height > 0 else {
            lblResult.textColor = .systemRed
            lblResult.backgroundColor = .clear
            lblResult.numberOfLines = 1
            lblResult.text = "숫자로 올바르게 입력해 주세요."
            
            commentLabel.text = "숫자로만 입력했는지 확인해 주세요."
            return
        }

        // cm 단위 키를 사용해 BMI를 계산합니다.
        let bmi = weight / (height * height * 0.0001)
        let shortenedBmi = String(format: "%.1f", bmi)

        let isMale = (genderSegment.selectedSegmentIndex == 0)
        let gender = isMale ? "남성" : "여성"

        // BMI 판정 기준은 학습용 예시이며 의료적 판단을 대체하지 않습니다.
        let normalMin = isMale ? 20.0 : 18.0
        let normalMax = isMale ? 25.0 : 23.0

        let body: String
        var color = UIColor.white
        var borderColor = UIColor.clear.cgColor
        var comment = ""

        if bmi < normalMin {
            body = "저체중"
            color = .systemTeal
            borderColor = UIColor.systemBlue.cgColor
            comment = "예시 기준상 저체중 범위에 해당합니다.\n식사를 규칙적으로 하고 근력 운동을 늘려 보세요."
        } else if bmi <= normalMax {
            body = "정상"
            color = .systemGreen
            borderColor = UIColor.systemGreen.cgColor
            comment = "예시 기준상 정상 범위입니다.\n지금과 같은 식습관과 운동 습관을 유지하면 좋겠습니다."
        } else if bmi <= normalMax + 3.0 {
            body = "과체중"
            color = .systemOrange
            borderColor = UIColor.systemOrange.cgColor
            comment = "예시 기준상 과체중 범위에 가깝습니다.\n가벼운 유산소 운동과 간단한 식단 조절을 시도해 보세요."
        } else {
            body = "비만"
            color = .systemRed
            borderColor = UIColor.systemRed.cgColor
            comment = "예시 기준상 비만 범위에 해당합니다.\n식습관 조절과 정기적인 운동, 전문가 상담을 권장합니다."
        }

        let normalMinText = String(format: "%.1f", normalMin)
        let normalMaxText = String(format: "%.1f", normalMax)

        lblResult.numberOfLines = 2
        lblResult.backgroundColor = color
        lblResult.textColor = .white
        lblResult.clipsToBounds = true
        lblResult.layer.cornerRadius = 10

        lblResult.text = "\(gender) / BMI: \(shortenedBmi) (\(body)) / 정상: \(normalMinText)~\(normalMaxText)"

        commentLabel.text = comment

        imgBmi.layer.borderWidth = 4
        imgBmi.layer.borderColor = borderColor

        print("BMI: \(shortenedBmi), 판정: \(body), 성별: \(gender)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.text = "성별을 선택하고 BMI 계산 버튼을 눌러 보세요."
        lblResult.numberOfLines = 2
        lblResult.textColor = .white
        lblResult.backgroundColor = .systemGreen
        lblResult.clipsToBounds = true
        lblResult.layer.cornerRadius = 10
        
        txtHeight.placeholder = "예: 160"
        txtWeight.placeholder = "예: 60"
        
        genderSegment.selectedSegmentIndex = 0
        
        commentLabel.text = ""
        commentLabel.numberOfLines = 0
        commentLabel.lineBreakMode = .byWordWrapping
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgBmi.layer.cornerRadius = imgBmi.bounds.width / 2
        imgBmi.clipsToBounds = true
    }
}
