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

