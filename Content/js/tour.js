
function openTab(e , idTab){
    var tabContent = document.getElementsByClassName("tab-content");
    for(let i =0 ; i<tabContent.length ; i++){
        tabContent[i].style.display= 'none';
    }
    tabContent[idTab-1].style.display= 'block';
}
document.getElementById("defautOpen").click();


window.addEventListener('scroll', function() {
    var x = pageYOffset;
    if (x < 650) {

        let a = document.getElementById("advert");
        a.style.position = "static";
        a.style.top = "auto";
        a.style.marginLeft="10px";
        a.style.marginTop="40px";
    } else if (x >= 650&&x<1200) {
        let a = document.getElementById("advert");
        a.style.position = "fixed";
        a.style.marginTop="40px"
        a.style.top = "90px";
        a.style.right = "123px";
    } else{
        let a = document.getElementById("advert");
        a.style.position = "static";
        a.style.top="auto";
        a.style.marginTop="600px";
    }
})