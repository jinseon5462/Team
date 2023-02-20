<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시네마</title>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
    <div class="videoWrap">
        <video id="video" autoplay muted loop>
            <!-- 로드시 랜덤 비디오 -->
        </video>
    </div>
</div>
<main>
    <div>
        <div class="titleWrap">
            <div class="sectionTitle on" id="movieChartTitle">무비차트</div>
            <div class="sectionTitle" id="upcomingTitle">상영예정작</div>
        </div>
    </div>
    <div class="section">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">
        <input type="radio" name="slide" id="slide04">
        <div class="slidewrap">
            <ul class="slidelist">
                <!--  -->
            </ul>
        </div>
    </div>
    <div class="storeSectionTitle"><a href="/user/storeView">스토어</a></div>
    <div class="storeSection">
        <div class="package">
            <h2><a href="/user/storeView">패키지</a></h2>
            <div class="packageWrap">
            </div>
        </div>
        <div class="ticket">
            <h2><a href="/user/storeView">영화 관람권</a></h2>
            <div class="ticketWrap">
            </div>
        </div>
        <div class="drink">
            <h2><a href="/user/storeView">스낵</a></h2>
            <div class="snackWrap">
            </div>
        </div>
    </div>
    <div class="bottomSectionWrap">
        <div class="wrap">
            <div class="eventWrapTitle">
                <a href="#">EVENT</a>
            </div>
            <div class="eventWrap">
                <!--  -->
            </div>
        </div>
        <div class="wrap">
            <div class="noticeWrapTitle">
                <a href="#">공지사항</a>
            </div>
            <div class="noticeWrap">
                <div>공지사항</div>
            </div>
        </div>
    </div>
    <div class="absoluteBtnWrap">
        <a href="/user/reservationMain" class="nowReservBtn">예매하기</a>	<!-- 범수행님 매핑 -->
        <a href="#header" class="scrollTopBtn">↑</a>
    </div>
</main>
<footer>푸터</footer>
<script>
    /* let time = 30;	// 30초
    let x = setInterval(function(){
        $("#demo").text(time + "초");
        time--;
        if(time < 0){
            document.querySelector("#video").replaceChildren();
            $("#video").html("<source src='https://adimg.cgv.co.kr/images/202302/MySweetMonster/pc_1080x608.mp4' type='video/mp4'>");
            time = 30;
        }
    }, 1000); */

    $(document).ready(getMainMovieList(), getStoreList(), randomVideo());

    function randomVideo(){
        const randomNum = Math.floor(Math.random() * 4 + 1);
        if(randomNum == 1){
            // 앤트맨
            //$("#demo").text(randomNum);
            $("#video").html("<source src='https://adimg.cgv.co.kr/images/202301/antman/0215_antman_pc_1080x608.mp4' type='video/mp4'>");
        }else if(randomNum == 2){
            // 미녀와 야수...?
            //$("#demo").text(randomNum);
            $("#video").html("<source src='https://adimg.cgv.co.kr/images/202302/MySweetMonster/pc_1080x608.mp4' type='video/mp4'>");
        }else if(randomNum == 3){
            // 대외비
            //$("#demo").text(randomNum);
            $("#video").html("<source src='https://adimg.cgv.co.kr/images/202302/TheDevilsDeal/main_1080x608.mp4' type='video/mp4'>");
        }else{
            // 카운트
            //$("#demo").text(randomNum);
            $("#video").html("<source src='https://adimg.cgv.co.kr/images/202301/count/0214_count_1080x608.mp4' type='video/mp4'>");
        }
    }

    //무비차트 목록 불러오기
    function getMainMovieList(){
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function(){
            let data = this.responseText;
            let list = JSON.parse(data);
            //console.log(list.length);
            //console.log(list.toString());
            //console.log(list[0].postFileName);
            let page = list.length / 5;
            //$(".slidelist")
            //console.log(page);
            let index = 0;
            for(let i = 0; i < page; i++){
                if(i == 0){
                    $(".slidelist").append(	// 첫페이지 일때
                        "<li>"
                        + "<div class='items'>"
                        + "<div class='item item" + i + "'></div>"
                        + "<label for='slide0" + (i + 2) + "' class='right'></label>"
                        + "</div>"
                        + "</li>"
                    );
                }else if(i == page - 1){	// 마지막 페이지일때
                    $(".slidelist").append(
                        "<li>"
                        + "<div class='items'>"
                        + "<label for='slide0" + i + "' class='left'></label>"
                        + "<div class='item item" + i + "'>"
                        + "</div>"
                        + "</div>"
                        + "</li>"
                    );
                }else{	// 그외 나머지
                    $(".slidelist").append(
                        "<li>"
                        + "<div class='items'>"
                        + "<label for='slide0" + i + "' class='left'></label>"
                        + "<div class='item item" + i + "'></div>"
                        + "<label for='slide0" + (i + 2) + "' class='right'></label>"
                        + "</div>"
                        + "</li>"
                    );
                }
                for(let j = 0; j < 5; j++){
                    //console.log(i);
                    //console.log(index);
                    //console.log(list[index].postFileName);
                    let ageTag;
                    if(list[index].viewAge == 12){
                        ageTag = "<div class='age' style='background-color: #e0c600;'>" + list[index].viewAge + "</div>";
                    }else if(list[index].viewAge == 15){
                        ageTag = "<div class='age' style='background-color: #d17300;'>" + list[index].viewAge + "</div>";
                    }else if(list[index].viewAge == 19){
                        ageTag = "<div class='age' style='background-color: #d12a00;'>" + list[index].viewAge + "</div>";
                    }else{
                        ageTag = "<div class='age' style='background-color: #318000;'>ALL</div>";
                    }
                    $(".item" +	i).append(
                        "<div class='movie'>"
                        + "<div class='movieInfoTopWrap'>"
                        + ageTag
                        + "<img src='/images/" + list[index].postFileName + "'>"
                        + "<div class='overlay'></div>"
                        + "<div class='buttons'>"
                        + "<button class='goMovieInfoBtn' value=" + list[index].movieCode + ">상세보기</button>"
                        + "<button class='goMovieResrvBtn' value=" + list[index].movieCode + ">예매하기</button>"
                        + "</div>"
                        + "<div class='ranking'>" + (index + 1) + "</div>"
                        + "<div class='gradient'></div>"	// 그라데이션
                        + "</div>"
                        + "<div class='movieInfo'>"
                        + (list[index].movieTitle.length < 10 ?
                            "<div class='movieInfoTitle'>" + list[index].movieTitle + "</div>"
                            : "<div class='movieInfoTitle'>" + list[index].movieTitle.substring(0, 10) + "···" + "</div>")
                        + "<div class='movieInfoBottomWrap'>"
                        + "<span class='rate'><span class='star'>★</span>" + list[index].avg + "</span><span class='reservationRate'>예매율 " + list[index].hit + "%</span>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                    );
                    index++;
                }
            }
            //alert("hello");
        }
        xhttp.open("get", "/user/main/getMainMoiveList.do", true);
        xhttp.send();
    }

    // 메인 스토어 섹션 리스트
    function getStoreList(){
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function(){
            let data = this.responseText;
            let list = JSON.parse(data);
            for(let i = 0; i < 9; i++){
                if(list[i].category == "package"){
                    $(".packageWrap").append(
                        "<a href='/user/productDetailView?productCode=" + list[i].productCode + "' class='storeItem storeItem1'>"
                        + "<img src=" + list[i].productImage + ">"
                        + "<div class='infoWrap'>"
                        + "<div>" + list[i].productName + "</div>"
                        + "<div>" + list[i].productInfo + "</div>"
                        + "</div>"
                        + "<span>" + list[i].price.toLocaleString('ko-KR') + "원</span>"
                        + "</a>"
                    );
                }else if(list[i].category == "ticket"){
                    $(".ticketWrap").append(
                        "<a href='/user/productDetailView?productCode=" + list[i].productCode + "' class='storeItem storeItem1'>"
                        + "<img src=" + list[i].productImage + ">"
                        + "<div class='infoWrap'>"
                        + "<div>" + list[i].productName + "</div>"
                        + "<div>" + list[i].productInfo + "</div>"
                        + "</div>"
                        + "<span>" + list[i].price.toLocaleString('ko-KR') + "원</span>"
                        + "</a>"
                    );
                }else{
                    $(".snackWrap").append(
                        "<a href='/user/productDetailView?productCode=" + list[i].productCode + "' class='storeItem storeItem1'>"
                        + "<img src=" + list[i].productImage + ">"
                        + "<div class='infoWrap'>"
                        + "<div>" + list[i].productName + "</div>"
                        + "<div>" + list[i].productInfo + "</div>"
                        + "</div>"
                        + "<span>" + list[i].price.toLocaleString('ko-KR') + "원</span>"
                        + "</a>"
                    );
                }
            }
        }
        xhttp.open("get", "/user/main/getStoreList.do", true);
        xhttp.send();
    }

    // 영화 상세보기 버튼
    $(document).on("click", ".goMovieInfoBtn", function(){
        //alert($(this).val());
        location.href = "/user/movieDetailView?movieCode=" + $(this).val();
    });

    // 스크롤 부드럽게
    $(document).on('click', 'a[href^="#"]', function (event) {
        event.preventDefault();	// 기능 차단
        $('html, body').animate({
            scrollTop: $($.attr(this, 'href')).offset().top
        }, 300);
    });
</script>
</body>
</html>
