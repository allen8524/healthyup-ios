# HealthyUp iOS

UIKit과 Storyboard 기반으로 개발한 iOS 건강 관리 학습 앱입니다. BMI 계산, 운동 정보 탐색, 운동 영상 재생, 운동 계획 설정 기능을 Tab Bar 구조로 구성했습니다.

## 앱 화면

| BMI 계산 | 운동 정보 | 운동 영상 |
| --- | --- | --- |
| <img src="docs/screenshots/bmi-result.png" width="220" alt="BMI 계산 결과 화면"> | <img src="docs/screenshots/workout-webview.png" width="220" alt="운동 정보 웹뷰 화면"> | <img src="docs/screenshots/workout-video.png" width="220" alt="운동 영상 선택 화면"> |

| 운동 계획 | 앱 아이콘 | Launch Screen |
| --- | --- | --- |
| <img src="docs/screenshots/workout-plan.png" width="220" alt="운동 계획 설정 화면"> | <img src="docs/screenshots/app-icon.png" width="150" alt="HealthyUp 앱 아이콘"> | <img src="docs/screenshots/launch-screen.png" width="220" alt="Launch Screen 화면"> |

## 프로젝트 개요

HealthyUp iOS는 iOS 프로그래밍 기초 학습 과정에서 제작한 건강 관리 앱입니다.

단순히 BMI를 계산하는 기능에서 끝나지 않고, BMI 결과 확인 후 운동 정보를 찾아보고, 운동 영상을 재생하며, 사용자가 직접 운동 계획을 설정하는 흐름까지 이어지도록 구성했습니다. 앱 문서와 저장소에서는 `HealthyUp iOS`라는 이름을 사용하며, 내부 Xcode 프로젝트 폴더명인 `BMI04-HMS`는 기존 구조를 유지합니다.

## 주요 기능

- BMI 계산
- 성별 선택에 따른 정상 BMI 범위 분기
- BMI 결과별 상태 메시지와 색상 표시
- `WKWebView` 기반 운동 정보 탐색
- `AVKit` 기반 로컬 운동 영상 재생
- `UISlider`, `UIStepper`, `UISegmentedControl`을 이용한 운동 계획 설정
- 앱 아이콘과 Launch Screen 적용

## 기술 스택

| 구분 | 사용 기술 |
| --- | --- |
| Language | Swift |
| UI | UIKit, Storyboard |
| Navigation | Tab Bar Controller |
| Web | WebKit |
| Video | AVKit |
| IDE | Xcode |

## 구현 포인트

- 키와 체중 입력값을 검증하고, 비어 있거나 올바르지 않은 값이 들어온 경우 안내 문구를 표시했습니다.
- cm 단위로 입력된 키를 이용해 BMI를 계산했습니다.
- 성별 선택값에 따라 정상 BMI 범위를 다르게 적용했습니다.
- BMI 결과에 따라 상태 문구, 배경색, 테두리 색상 등 UI 피드백을 다르게 표시했습니다.
- `URLComponents`와 `URLQueryItem`을 사용해 외부 검색 URL을 생성하고 `WKWebView`에서 로드했습니다.
- 앱 번들 내부의 mp4 파일을 찾아 `AVPlayerViewController`로 재생했습니다.
- `UISlider`와 `UIStepper` 값이 변경될 때마다 운동 시간, 세트 수, 운동 계획 요약 문구가 실시간으로 갱신되도록 구현했습니다.

## 화면 구성

- BMI 계산 화면: 키, 체중, 성별을 입력하고 BMI 결과와 상태 메시지를 확인합니다.
- 운동 정보 화면: `WKWebView`를 통해 운동 관련 검색 결과와 영상을 탐색합니다.
- 운동 영상 화면: 벤치프레스, 스쿼트, 데드리프트 등 로컬 mp4 운동 영상을 재생합니다.
- 운동 계획 화면: 운동 강도, 시간, 세트 수를 선택해 오늘의 운동 계획 문구를 확인합니다.
- 앱 아이콘 / Launch Screen: 앱 실행 전후에 보이는 기본 브랜딩 요소를 적용했습니다.

## 실행 방법

```bash
git clone https://github.com/allen8524/healthyup-ios.git
cd healthyup-ios
```

1. `BMI04-HMS.xcodeproj` 파일을 Xcode에서 엽니다.
2. 실행 대상 기기를 iPhone Simulator로 선택합니다.
3. Xcode 상단의 Run 버튼을 눌러 앱을 실행합니다.

## 프로젝트 구조

```text
HealthyUp-iOS/
├── BMI04-HMS/
│   ├── ViewController.swift
│   ├── WebViewController.swift
│   ├── VideoViewController.swift
│   ├── PlanViewController.swift
│   ├── Assets.xcassets
│   ├── Main.storyboard
│   └── LaunchScreen.storyboard
├── BMI04-HMS.xcodeproj
├── docs/
│   └── screenshots/
└── README.md
```

| 파일 | 역할 |
| --- | --- |
| `ViewController.swift` | BMI 계산, 성별에 따른 정상 범위 분기, 결과별 UI 피드백을 담당합니다. |
| `WebViewController.swift` | `WKWebView`를 이용해 운동 정보 검색 페이지와 운동 관련 영상 검색 페이지를 로드합니다. |
| `VideoViewController.swift` | 번들에 포함된 로컬 mp4 운동 영상을 `AVPlayerViewController`로 재생합니다. |
| `PlanViewController.swift` | 운동 강도, 운동 시간, 세트 수 입력값을 바탕으로 운동 계획 요약 문구를 갱신합니다. |
| `Assets.xcassets` | 앱 아이콘과 화면에서 사용하는 이미지 리소스를 관리합니다. |
| `docs/screenshots` | README에 표시할 앱 실행 화면과 Xcode 적용 화면 이미지를 보관합니다. |

## 참고

영상 자료는 학습 및 과제 시연 목적으로 사용했습니다. 공개 포트폴리오에서는 직접 제작한 영상이나 출처가 명확한 자료로 대체할 수 있습니다.

## 개선 계획

- 운동 정보 로컬 데이터화
- BMI 이력 저장 기능
- 사용자별 운동 목표 저장
- HealthKit 연동 가능성 검토
- 영상 자료 출처 정리 또는 직접 제작 영상으로 대체
