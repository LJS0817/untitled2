<div align="center">
  
# 💳 Card Usage Tracker

**개인 맞춤형 카드 사용 내역 기록 및 지출 관리 플러터(Flutter) 어플리케이션**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://pub.dev/packages/sqflite)
[![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)](https://www.figma.com/design/VHKiNzWC2pKVbziPUB3oBS/Untitled?node-id=0-1&t=x4cDlNAd13y5BhWy-1)

</div>

---

## 📌 Project Overview
**Card Usage Tracker**는 개인의 카드 사용 내역을 효율적으로 기록하고 관리하기 위해 개발된 모바일 어플리케이션입니다. 
빠른 기록과 직관적인 데이터 관리를 목표로 설계되었으며, `shared_preferences` 대신 관계형 데이터베이스인 `sqflite`를 채택하여 데이터 쿼리와 영구 저장의 안정성을 극대화했습니다.

### 🔗 Links
- [🎨 Figma UI/UX Design](https://www.figma.com/design/VHKiNzWC2pKVbziPUB3oBS/Untitled?node-id=0-1&t=x4cDlNAd13y5BhWy-1)

---

## 🛠 Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Provider
- **Local Database:** sqflite
- **Animation:** flutter_animate

---

## ✨ Key Features
- **효율적인 지출 기록:** 카드별 결제 내역과 예산을 직관적으로 추가하고 관리할 수 있습니다.
- **로컬 데이터베이스(SQLite):** 기기 내부에 데이터를 안전하고 빠르게 저장하며, 복잡한 쿼리 처리에도 성능을 유지합니다.
- **부드러운 UI/UX:** `flutter_animate`를 활용하여 사용자 상호작용 시 부드럽고 우아한 화면 전환과 피드백을 제공합니다.
- **직관적인 상태 관리:** `Provider`를 통해 위젯 트리 전반에 걸쳐 효율적인 상태 업데이트를 구현했습니다.

---

## 🔥 Challenge & Solution (Troubleshooting)

### 🚨 SQLite 비동기 초기화에 따른 Race Condition 이슈
- **Problem:** 
  **AI 도구의 도움 없이 혼자서 기획부터 개발까지 전담하여 진행하던 중**, 프로젝트 초기 `DatabaseMng` 클래스의 `init()` 메서드를 각 데이터 조회 함수(`getInfo()`, `getCustom()` 등)에서 **지연 초기화(Lazy Initialization)** 방식으로 호출하도록 구현했습니다. 
  하지만 Flutter의 비동기(`async/await`) 특성상, 앱 구동 시 여러 위젯이 동시에 렌더링되며 DB 접근을 시도할 때 `db` 객체가 아직 `null`인 상태에서 `openDatabase`가 중복 호출되는 동시성(Race Condition) 문제가 발생했습니다. 이로 인해 초기 데이터가 Null로 처리되어 에러가 나거나 화면이 멈추는 간헐적 이슈가 있었습니다.

- **Solution:** 
  데이터베이스 헬퍼 클래스를 완벽한 **싱글톤(Singleton) 패턴**으로 재설계하고, 앱 구동 초기 단계(Splash 화면이나 최상단 Provider 주입 전)에서 `await init()`을 단 한 번만 확실하게 완료하도록 생명주기(Lifecycle)를 개선했습니다. 
  결과적으로 하위 위젯들이 렌더링될 때는 이미 DB가 안전하게 준비된 상태를 보장하게 되어 렌더링 에러와 중복 초기화 문제를 완벽하게 해결했습니다.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Latest Version)
- Android Studio / Xcode for Emulator

### Installation
1. Repository를 클론합니다.
```bash
git clone https://github.com/LJS0817/untitled2.git
```
2. 패키지를 다운로드합니다.
```bash
flutter pub get
```
3. 앱을 실행합니다.
```bash
flutter run
```

<br>

<div align="center">
  <i>Developed by <b>LJS0817</b> for personal productivity</i>
</div>
