# 📓 SSAC BootCamp Assignment

## 목적
    iOS SSAC 부트캠프 과제를 수행하며 제작한 앱에 대한 피드백과 회고, 리팩토링 진행



| 과제 이름                 | 주제           | 과제기간                         |  피드백                                           |
| --------------------- | ------------- | --------------------------     |-----------------------------------------------------|
| 배달의 민족 매인 페이지 클론 | CollectionView, MVVM    |  **2021.09.28 ~ 2021.09.28**    |  디자인 패턴에 대한 더 정확한 이해, 전체 코드로 다시 짜볼 것  |
| Netflix 매인 페이지 클론   | CollectionView, View   |  **2021.09.29 ~ 2021.09.29**    |  추후 전체 코드로 레이아웃 수정할 것                     |

<br></br>
<br></br>


# 📃 과제 진행 세부사항

## 🙆🏻‍♂️ 1. 배달의 민족 매인 페이지

[해당폴더로이동](https://github.com/coddang/BootCamp_Assignment/tree/master/SSACDAY1.DELIVERY_APP_MAIN_PAGE) 
 
<br>

**`학습 중요 포인트`: CollectionView, MVVM, AutoSlide Banner, Layout**

    첫 과제로 진행되었으며 CollectionView를 통해서 싱글톤으로 제작하려는 목적
    
    MVVM 디자인 패턴을 적용하기 위해서 노력함
    

<br>

**`과제기간`: 2021.09.28 ~ 2021.09.28** 

<br></br>

✨ **실행화면**

<br>

![SSACDAY1 DELIVERY_APP_MAIN_PAGE](https://user-images.githubusercontent.com/90245972/135297179-4787d3a7-9170-4bdd-9f33-13fd51c21a5a.gif)


<br></br>

✨ **피드백&회고**

    디자인에 디자인 패턴에 대한 더 정확한 이해가 필요했다.
    
    전에 만들어봤던 코드에서 생각나는 대로 막 구현하다 보니 크게 많지 않은 코드임에도 오래 걸렸다.
    
    레이아웃에 대한 부분은 어느정도 대응했지만 전체 레이아웃부터 끝까지 코드로 다시 짤 수 있냐고 하면 아직 부족하다. 이부분을 더 보완해서 스토리보드 지우고 다시 코드로 리팩토링할 필요성이 있다고 느낀다.
    

<br></br>

-------------------------------------------------------

<br></br>

## 🦞 2. Netflix 매인 페이지 클론

[해당폴더로이동](https://github.com/coddang/BootCamp_Assignment/tree/master/SSACDAY1.NETFLIX_MAIN_PAGE) 

<br>

**`학습 중요 포인트`: CollectionView, View**

    두 번째 과제로 진행, CollectionView에 대한 사용과 View.layer, StackView
    

<br>

**`과제기간`: 2021.09.29 ~ 2021.09.29**

<br></br>

✨ **실행화면**

<br>


![SSACDAY1 NETFLIX_MAIN_PAGE](https://user-images.githubusercontent.com/90245972/135297249-a5bf0bc2-b611-4702-bc5c-b6f8f56d3c7e.gif)


<br></br>

✨ **피드백&회고**

    콜렉션뷰와 스택뷰 레이아웃에 대한 추가 학습 필요,
    
    오토레이아웃 적용X -> 적용해보고, 추후 전체 코드로 레이아웃 수정할 것
    
    처음에는 콜렉션뷰 없이 `CALayer()` 를 만들고 `InsetSubLayer()`를 통해 레이아웃을 구현했다.

<br></br>

-------------------------------------------------------
<br></br>


# Git: Commit Message Convention

<br>

## Commit Type
  - Initialization : 초기화
  - Add : 파일 추가
  - Comment : 필요한 주석 추가 및 변경  
  - Rename : 파일 혹은 폴더명을 수정하거나 옮기는 작업만인 경우 
  - Remove : 파일을 삭제하는 작업만 수행한 경우
  - Feat : 새로운 기능 추가
  - Delete : 기능 삭제
  - Update : 기능 수정
  - Fix : 버그 수정
  - Refactor: 리팩토링
  - Design : 사용자 UI 디자인 변경시
  - !BREAKING CHANGE : API 변경의 경우
  - !HOTFIX : 급하게 치명적인 버그 수정시 사용
  - Style : 스타일 (코드 포맷 변경, 세미 콜론 누락, 코드 수정이 없을 때)
  - Docs : 문서 수정, 삭제 (subject에 이모지 추가 필수: 📚)
  - Chore : 기타 변경사항 (빌드 스크립트 수정, 에셋 추가 등)
  - Test : 테스트 추가, 테스트 리팩토링 (비즈니스 코드 변경 없을 시) 
  - Chore : 빌드 태스트 업데이트, 패키지 매니저를 설정하는 경우 (비즈니스 코드 변경 없을 시) 

<br>
