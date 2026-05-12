import UIKit

class PlanViewController: UIViewController {
    
    @IBOutlet weak var levelSegment: UISegmentedControl!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var setStepper: UIStepper!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelSegment.setTitle("가볍게", forSegmentAt: 0)
        levelSegment.setTitle("보통", forSegmentAt: 1)
        levelSegment.setTitle("강하게", forSegmentAt: 2)

        // 긴 문구가 잘리지 않도록 라벨 표시를 조정합니다.
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.minimumScaleFactor = 0.7
        
        setLabel.adjustsFontSizeToFitWidth = true
        setLabel.minimumScaleFactor = 0.7
        
        summaryLabel.numberOfLines = 0
        summaryLabel.lineBreakMode = .byWordWrapping
        
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
        case 1: levelText = "보통 강도로"
        default: levelText = "강하게"
        }
        
        let minutes = Int(timeSlider.value.rounded())
        let sets = Int(setStepper.value)
        
        summaryLabel.numberOfLines = 0
        summaryLabel.text = """
        오늘은 \(levelText) 운동합니다.
        총 \(minutes)분 동안 \(sets)세트를 진행해 보세요.
        """
    }
}
