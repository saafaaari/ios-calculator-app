# 목차

- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 구조](#프로젝트-구조)
- [키워드](#키워드)
- [학습 내용](#학습-내용)


## 프로젝트 소개

## 프로젝트 구조(UML)

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 키워드
`TDD` `UnitTest` `Protocol` `Generic` `LLDB` `ErrorHandling`

## 학습 내용


### 고민한 점
- Queue 타입 구현에 있어 어떠한 방법으로 구현할까?
- Queue 타입에 들어올 데이터를 어떤 방법으로 제한할까?
- Side Effect를 최소화 할 수 있는 프로그래밍 방법
- Mutating/nonmutating에 따른 함수 네이밍 방법

### 배운 개념
- 시간 복잡도
- 자료구조(스택, 큐, 리스트)
- 제네릭
- TDD및 유니테스트
- 의존성 분리
- Frame와 Bounds
- View Update Cycle


#### 시간복잡도
- O(1): 연산을 처리하는데 오직 한 단계만 거침.
- O(log n): 연산을 하는데 필요한 단계들이 연산마다 특정 요인에 의해 줄어듬.
- O(n): 연산단계의 수와 입력값 n이 1:1 관계를 가짐.
- O(n log n): 연산단계의 수가 N*(log2N) 번만큼의 수행시간을 가진다. (선형로그형)
- O(n^2): 연산단계의 수는 입력값 n의 제곱.
- O(C^n): 연산단계의 수는 주어진 상수값 C 의 n 제곱.

시간 복잡도는 특정 연산을 하는데 입력값에 의해 연산시간이 어떤식으로 영향을 받나를 표시하는 것

#### 자료구조(스택, 큐, 리스트)
- 스택: 선입후출 => 먼저 들어간 것이 가장 마지막에 나온다.
- 큐: 선입선출 => 먼저 들어간 것이 가장 먼저 나온다.
- 연결 리스트: 객체(노드)를 주소값을 이용하여 연쇄적으로 연결시켜 데이터를 관리하는 자료구조

#### 제네릭
> [제네릭](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.15%20%EC%A0%9C%EB%84%88%EB%A6%AD%2C%20TDD.md)은 타입 내부에서 사용되는 타입을 나중에 정한다.(인스턴스에서 넣어주거나 파라미터를 따름)

이번 프로젝트에서 제네릭을 이용한 이유는,
큐 컬렉션에 들어올 타입을 미리 결정하지 않기 위해 사용했다. swift에서 한 타입만을 결정하지 않고 타입을 사용하는 방법이 제네릭과 프로토콜로 결합도를 낮춰 프로토콜을 채택한 타입만을 받을 수 있는 방법 두 가지가 떠올랐고, 두 가지 방법 모두 사용해 보았다. 제네릭을 사용하면 인스턴스를 만들 때 타입이 정해져 그 인스턴스엔 정해진 타입만 담을 수 있고, 프로토콜을 사용하면, 채택한 타입은 모두 담을 수 있지만, 빈번한 다운 캐스팅을 해야 했고, 기존에 swift에 존재하는 컬렉션 타입 모두 제네릭을 사용하고 있는 점을 보았을 때, 제네릭을 사용하는 방법이 타당하다고 생각이 들었다. 때문에 프로토콜은 제네릭으로 들어올 수 있는 타입을 제약하는 방법으로 사용하였다.


#### TDD및 유니테스트
> [TDD](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.15%20%EC%A0%9C%EB%84%88%EB%A6%AD%2C%20TDD.md)는 개발 방법론 중 하나.
테스트를 거쳐가며, 기능을 구현하는 방법이다. TDD는 몇가지 절차를 반복하며, 기능을 구현하게 된다.

아래의 절차대로 진행
- 가장 먼저 테스트 코드를 작성한다.
- 테스트가 실패하도록 로직을 구현한다.(RED)
- 테스트가 성공하도옥 로직을 구현한다.(GREEN)
- 리펙토링(Refactor)

<img src="https://i.imgur.com/XQnePZF.png" width="500">


[유니테스트](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.17%20%EC%9C%A0%EB%8B%88%ED%85%8C%EC%8A%A4%ED%8A%B8%2C%20%EC%9D%98%EC%A1%B4%EC%84%B1%20%EC%A3%BC%EC%9E%85%EA%B3%BC%20%EB%B6%84%EB%A6%AC.md)는 TDD에서 테스트 하는 방법 단위 테스트라고도 한다.
코드를 검증하는 절차이고, 메소드에 대한 테스트 케이스(Test case)를 작성하는 절차를 말한다.


#### 의존성 분리
객체지향 설계 5가지 원칙 [SOLID](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.18%20%EC%86%94%EB%A6%AC%EB%93%9C.md)에서 좋은 객체지향 설계에선 철저히 객체간 분리를 이야기하고 있다. 이를 Swift에선 Protocol를 이용하여 결합도를 낮춰줄 수 있다. [의존성 분리](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.17%20%EC%9C%A0%EB%8B%88%ED%85%8C%EC%8A%A4%ED%8A%B8%2C%20%EC%9D%98%EC%A1%B4%EC%84%B1%20%EC%A3%BC%EC%9E%85%EA%B3%BC%20%EB%B6%84%EB%A6%AC.md)하여 결합도를 낮춰줌으로써 Unitest에서도 특정 객체만 테스트를 진행할 수 있다.

#### Frame와 Bounds


#### View Update Cycle
> 요청 받은 뷰 변경사항을 특정 시점에서 한번에 처리하는 방법

이번 프로젝트에서 스크롤 뷰를 사용하며, View가 메소드 등으로 변화가 생기면, 메소드가 호출된 시점에 View가 수정되는 것이 아닌 [View Update Cycle](https://github.com/saafaaari/Today-I-Learned/blob/main/2022.03/2022.03.25%20View%20%EC%97%85%EB%8D%B0%EC%9D%B4%ED%8A%B8.md)라는 주기를 가지며, view가 수정된다는 것을 알 수 있었다.






