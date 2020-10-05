function openTab(e , idTab){
    var tabContent = document.getElementsByClassName("tab-content");
    for(let i =0 ; i<tabContent.length ; i++){
        tabContent[i].style.display= 'none';
    }
    tabContent[idTab-1].style.display= 'flex';
}
document.getElementById("defautOpen").click();
