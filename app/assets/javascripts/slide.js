var currentItemNum = 1;

var $slideContainer = $('.slider__container');

//クラスslider__itemの要素の個数を算出
var slideItemNum = $('.slider__item').length;

//スタイド１つあたりの横幅を算出
var slideItemWidth = $('.slider__item').innerWidth();

//スライド１つあたりの横幅とスライドの個数から
var slideContainerWidth = slideItemWidth * slideItemNum;

//スライドさせる速さ(animateメソッド用)
var DURATION = 1000;

//横に並べた複数のスライドを格納する用コンテナの横幅を設定
$slideContainer.attr('style', 'width:' + slideContainerWidth + 'px');

//スライドを自動的に変化させる関数
function autoSlide(){
    //現在のスライドの番号が全部のスライドの数より少ないとき
    if(currentItemNum < slideItemNum){
        //スライド用コンテナをanimateメソッドで変化させる
        $slideContainer.animate({left: '-='+slideItemWidth+'px'}, DURATION);//現在のCSSのleftのプロパティの値からスライド１つあたりの横幅分変化させる
        currentItemNum++;//現在のスライド番号を１増やす
    //現在のスライドの番号が全部のスライドの数と同じとき
    }else if(currentItemNum = slideItemNum){
        //現在のCSSのleftのプロパティの値を変更(徐々に変化させないのでanimateメソッドは使わない)
        $slideContainer.animate({left: '+='+slideItemWidth*(slideItemNum-1)+'px'}, DURATION);
        currentItemNum = 1;//現在のスライド番号を１に戻す
    }
}

//setInterval関数で適当な秒数ごとに実施
setInterval(autoSlide, 5000);