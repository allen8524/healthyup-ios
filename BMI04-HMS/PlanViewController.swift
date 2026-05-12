import UIKit

class PlanViewController: UIViewController {
    
    @IBOutlet weak var levelSegment: UISegmentedControl!  // 가볍게 / 보통 / 빡세게
    @IBOutlet weak var timeSlider: UISlider!              // 10 ~ 120분
    @IBOutlet weak var timeLabel: UILabel!                // "운동 시간: XX분"
    @IBOutlet weak var setStepper: UIStepper!             // 1 ~ 10세트
    @IBOutlet weak var setLabel: UILabel!                 // "세트 수: X세트"
    @IBOutlet weak var summaryLabel: UILabel!             // 오늘의 운동 계획 요약
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 라벨 줄 수 / 줄바꿈 설정
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.minimumScaleFactor = 0.7
        
        setLabel.adjustsFontSizeToFitWidth = true
        setLabel.minimumScaleFactor = 0.7
        
        summaryLabel.numberOfLines = 0              // 여러 줄 허용
        summaryLabel.lineBreakMode = .byWordWrapping // ... 말고 줄바꿈
        
        // 슬라이더 / 스텝퍼 기본값 설정
        timeSlider.minimumValue = 10
        timeSlider.maximumValue = 120
        timeSlider.value = 40
        
        setStepper.minimumValue = 1
        setStepper.maximumValue = 10
        setStepper.stepValue = 1
        setStepper.value = 3
        
        updateTimeLabel()
        updateSetLabel()
        updateSummary()
    }
    
    // MARK: - Actions
    
    @IBAction func changeLevel(_ sender: UISegmentedControl) {
        updateSummary()
    }
    
    @IBAction func changeTime(_ sender: UISlider) {
        updateTimeLabel()
        updateSummary()
    }
    
    @IBAction func changeSet(_ sender: UIStepper) {
        updateSetLabel()
        updateSummary()
    }
    
    // MARK: - Private helpers
    
    private func updateTimeLabel() {
        let minutes = Int(timeSlider.value.rounded())
        timeLabel.text = "운동 시간: \(minutes)분"
    }
    
    private func updateSetLabel() {
        let sets = Int(setStepper.value)
        setLabel.text = "세트 수: \(sets)세트"
    }
    
    private func updateSummary() {
        let levelText: String
        switch levelSegment.selectedSegmentIndex {
        case 0: levelText = "가볍게"
        case 1: levelText = "보통 강도"
        default: levelText = "빡세게"
        }
        
        let minutes = Int(timeSlider.value.rounded())
        let sets = Int(setStepper.value)
        
        summaryLabel.numberOfLines = 0
        summaryLabel.text = """
        오늘은 \(levelText)로 운동합니다.
        총 \(minutes)분 동안 \(sets)세트 진행해 보세요!
        """
    }
}
