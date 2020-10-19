
const tabItems=document.querySelectorAll(".tab-item");
const tabContentItems=document.querySelectorAll(".tab-content-item");
function selectItem(e){
    removeBorder();
    removeShow();
    this.classList.add("tab-border")
    const tabContentItem=document.querySelector(`#${this.id}-content`);
    tabContentItem.classList.add('show');
}
function removeShow(){
    tabContentItems.forEach(item=>item.classList.remove("show"));
}
function removeBorder(){
    tabItems.forEach(item=>item.classList.remove("tab-border"));
}
tabItems.forEach(item => item.addEventListener("click",selectItem));
document.getElementById("tab-1").click();

window.addEventListener('scroll', function() {
    var width = $(window).width();
    if(width>1295){
            var x = pageYOffset;
        if (x < 720) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 720&&x<1330) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="21.2%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top="580px";
            a.style.width = "100%"
        }
    }
    else if(width<=1295&&width>=1150){
        var x = pageYOffset;
        if (x < 650) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 650&&x<1200) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="21%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top="520px";
            a.style.width = "100%"
        }
    }
    else if(width<1150&&width>=960){
        var x = pageYOffset;
        if (x < 550) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 550&&x<1000) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="20.5%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top="420px";
            a.style.width = "100%"
        }
    }
})