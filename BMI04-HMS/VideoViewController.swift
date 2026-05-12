import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    // MARK: - IBActions
    
    @IBAction func tapBenchPress(_ sender: UIButton) {
        playVideo(named: "bench", title: "벤치프레스")
    }
    
    @IBAction func tapSquat(_ sender: UIButton) {
        playVideo(named: "squat", title: "스쿼트")
    }
    
    @IBAction func tapDeadlift(_ sender: UIButton) {
        playVideo(named: "deadlift", title: "데드리프트")
    }
    
    // MARK: - Playback
    
    private func playVideo(named name: String, title: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp4") else {
            showAlert(message: "\(title) 영상 파일을 찾을 수 없습니다.\n파일 이름과 Target Membership 설정을 확인하세요.")
            return
        }
        
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.title = title
        
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // MARK: - Alert
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "재생 오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
