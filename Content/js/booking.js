const tabItems=document.querySelectorAll(".tab-item");
const tabContentItems=document.querySelectorAll(".tab-content-item");
function gotostep(step) {
    removeBorder();
    removeShow();
    const tabitem = document.querySelector("#tab-" + step);
    tabitem.classList.add("tab-border")
    const tabContentItem = document.querySelector("#tab-" + step + "-content");
    tabContentItem.classList.add('show');
    var lisNameKH = document.getElementsByClassName("fullname")
    var lisNSKH = document.getElementsByClassName("dateofb")
    var lisAdrKH = document.getElementsByClassName("adr")
    var lisTypeKH = document.getElementsByClassName("typecustomer")
    var lisSexKH = document.getElementsByClassName('sex')
    var listnamekh = []
    var listnskh = []
    var listadrkh = []
    var listsexkh = []
    var listtypekh = []
    for (i = 0; i < lisNameKH.length; i++) {
        listnamekh.push(lisNameKH[i].value)
        listnskh.push(lisNSKH[i].value)
        listadrkh.push(lisAdrKH[i].value)
        listtypekh.push(lisTypeKH[i].value)
        listsexkh.push(lisSexKH[i].value)
    }
    alert(typeof (listnamekh[0]))
    $.ajax({
        type: 'GET',
        data: { mangten: JSON.stringify(listnamekh), mangdiachi: JSON.stringify(listadrkh), mangloai: JSON.stringify(listtypekh), manggt: JSON.stringify(listsexkh), mangngay: JSON.stringify(listnskh), soluong: lisNameKH.length },
        url: '/Tour/CapnhatKH',
        success: function (result) {
            
            alert('success')
        },
        error: function (e) {
            alert(e.responseText);
        }
    });
    var Matour = document.getElementById('_matour').getAttribute('value');
    var Ngaycheckin = $("#_ngaycheckin").val()
    var Pickupplace = $("#_pickupplace").val()
    alert(Matour)
    alert(Ngaycheckin)
    alert(Pickupplace)
    $.ajax({
        type: 'GET',
        data: { pickupplace: Pickupplace, matour: Matour },
        url: '/Tour/CapnhatPhieuDatTour',
        success: function (result) {

            alert('thanhcong')
        },
        error: function (e) {
            alert(e.responseText);
        }
    });
}
function removeShow(){
    tabContentItems.forEach(item=>item.classList.remove("show"));
}
function removeBorder(){
    tabItems.forEach(item=>item.classList.remove("tab-border"));
}
$('#submit').click(function(e){ 
    e.preventDefault();
});
//tabItems.forEach(item => item.addEventListener("click",selectItem));
function insertCustomer() {
    var x = document.getElementById("tablecustomers").rows.length;
    document.getElementById("tablecustomers").insertRow(-1).innerHTML = '<tr><td>' + x +'</td><td><input type="text"class="fullname"></td><td><input type="date" class="dateofb"></td><td><input type="text" class="adr"></td><td><select name="sex" class="sex"><option value="Male">Male</option><option value=">Female">Female</option></select></td><td><select name="typecustomer" class="typecustomer"><option value="VietNamese">VietNamese</option><option value="#">Overseas Vietnamese</option><option value="Foreigner">Foreigner</option></select></td><td><input type="text" class="age"></td><td><input type="text" class="pri"></td></tr><td><button class="trash fas fa-trash"onclick="deletecustomer(this)"></button></td>';
}
function deletecustomer(x){
    var i = x.parentNode.parentNode.rowIndex;
    document.getElementById("tablecustomers").deleteRow(i);
    var l = document.getElementById("tablecustomers").rows.length;
    for(var t=1;t<l;t++){
        document.getElementById("tablecustomers").rows[t].cells[0].innerHTML=t;
    }
}
function getDaycheckout() {
    	$.ajax({
		type: 'GET',
		data: { mavung: index },
		url: 'ListDesByArea',
		success: function (result) {
			$('#lisdesbyarea').html(result);
		},
		error: function (e) {
			alert(e.responseText);
		}
	});
}
//function handler(e) {
//    var ngaycheckout = document.getElementById('_ngaycheckin').value;
//    document.getElementById("_ngaycheckout").value = ngaycheckout;
//}