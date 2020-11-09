const tabItems=document.querySelectorAll(".tab-item");
const tabContentItems=document.querySelectorAll(".tab-content-item");
function gotostep(step) {
    removeBorder();
    removeShow();
    const tabitem = document.querySelector("#tab-" + step);
    tabitem.classList.add("tab-border")
    const tabContentItem = document.querySelector("#tab-" + step + "-content");
    tabContentItem.classList.add('show');
    var _tennlh = $('#tennlh').val();
    var _emailnlh = $('#emailnlh').val();
    var _diachinlh = $('#diachinlh').val();
    var _dtnlh = $('#dtnlh').val();
    var _notenlh = $('#notenlh').val();
    $.ajax({
        type: 'POST',
        data: { ten: _tennlh, email: _emailnlh, diachi: _diachinlh, dienthoai: _dtnlh, note: _notenlh },
        url: '/Tour/CapnhatTTNLH',
        success: function (result) {

            alert('thanhconghaha')
        },
        error: function (e) {
            alert(e.responseText);
        }
    });
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
    $.ajax({
        type: 'POST',
        data: { mangten: JSON.stringify(listnamekh), mangdiachi: JSON.stringify(listadrkh), mangloai: JSON.stringify(listtypekh), manggt: JSON.stringify(listsexkh), mangngay: JSON.stringify(listnskh), soluong: lisNameKH.length },
        url: '/Tour/CapnhatKH',
        success: function (result) {
            
            alert('successkh')
        },
        error: function (e) {
            alert(e.responseText);
        }
    });
    var Matour = document.getElementById('_matour').getAttribute('value');
    var Ngaycheckin = $("#_ngaycheckin").val()
    var Pickupplace = $("#_pickupplace").val()
    var Tonggia = $("#tonggiatien").val()
    $.ajax({
        type: 'POST',
        data: { pickupplace: Pickupplace, matour: Matour, gia: Tonggia },
        url: '/Tour/CapnhatPhieuDatTour',
        success: function (result) {

            alert('thanhcongphieudattour')
        },
        error: function (e) {
            alert('');
        }
    });
    
    var m = "Welcome, " + _tennlh.toString() + '\n' + "Ma tour: " + Matour.toString() + '\n'  + "Tong thanh toan: " + Tonggia.toString() + '\n' + "Dai li se lien he voi ban trong thoi gian som nhat.Xin chan thanh cam on";
    $.ajax({
        type: 'POST',
        url: '/Tour/SendMail',
        data: { _mess: m }
    }).done(function () {
        //alert('');
    });
    //goStep()
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
    document.getElementById("tablecustomers").insertRow(-1).innerHTML = '<tr><td>' + x + '</td><td><input type="text"class="fullname"></td><td><input type="date" class="dateofb" id="dateofb'+x+'" onchange="CapNhatTuoi(event,' + x + ')"></td><td><input type="text" class="adr"></td><td><select name="sex" class="sex"><option value="Male">Male</option><option value=">Female">Female</option></select></td><td><select name="typecustomer" class="typecustomer" id="loai' + x + '" onchange="CapNhatLoai(event,' + x +')"><option value="VietNamese">VietNamese</option><option value="Overseas Vietnamese">Overseas Vietnamese</option><option value="Foreigner">Foreigner</option></select></td><td><div class="age" id="age' + x + '"></div></td><td><div class="pri" id="pri'+x+'"></div></td></tr><td><button class="trash fas fa-trash"onclick="deletecustomer(this)"></button></td>';
    DayformatBirth()
    TongGiaTien()
}
function deletecustomer(x){
    var i = x.parentNode.parentNode.rowIndex;
    document.getElementById("tablecustomers").deleteRow(i);
    var l = document.getElementById("tablecustomers").rows.length;
    for(var t=1;t<l;t++){
        document.getElementById("tablecustomers").rows[t].cells[0].innerHTML=t;
    }
}
//function getDaycheckout() {
//    	$.ajax({
//		type: 'GET',
//		data: { mavung: index },
//		url: 'ListDesByArea',
//		success: function (result) {
//			$('#lisdesbyarea').html(result);
//		},
//		error: function (e) {
//			alert(e.responseText);
//		}
//	});
//}
function CapNhatTuoi(e, index) {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    var Cdate = new Date(today)
    var Bdate = new Date(e.target.value)
    var diff = Cdate - Bdate;
    var diffdays = diff / 1000 / (60 * 60 * 24);
    var age = Math.floor(diffdays / 365.25);
    document.getElementById("age"+index).innerHTML = age;
    var loai = $('#loai'+index+' option:selected').val();
    var n1 = loai.localeCompare("VietNamese");
    var n2 = loai.localeCompare("Overseas Vietnamese");
    var n3 = loai.localeCompare("Foreigner");
    var price = 0;
    if (n1 == 0 && age < 5) {
        price = 500
    }
    else if (n1 == 0 && age >= 5 && age <= 8) {
        price = 800
    }
    else if (n1 == 0 && age >= 9) {
        price = 1000
    }

    if (n2 == 0 && age < 5) {
        price = 500
    }
    else if (n2 == 0 && age >= 5 && age <= 8) {
        price = 900
    }
    else if (n2 == 0 && age >= 9) {
        price = 1200
    }

    if (n3 == 0 && age < 5) {
        price = 500
    }
    else if (n3 == 0 && age >= 5 && age <= 8) {
        price = 1000
    }
    else if (n3 == 0 && age >= 9) {
        price = 1400
    }
    document.getElementById("pri" + index).innerHTML = price;
    document.getElementById("pri" + index).value = price;
    TongGiaTien()
}
function CapNhatLoai(e,index) {
    var dateselect = $('#dateofb'+index).val()
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    var Cdate = new Date(today)
    var Bdate = new Date(dateselect)
    var diff = Cdate - Bdate;
    var diffdays = diff / 1000 / (60 * 60 * 24);
    var age = Math.floor(diffdays / 365.25);
    var loai = e.target.value
    var n1 = loai.localeCompare("VietNamese");
    var n2 = loai.localeCompare("Overseas Vietnamese");
    var n3 = loai.localeCompare("Foreigner");
    var price = 0;
    if (n1 == 0 && age < 5) {
        price = 500
    }
    else if (n1 == 0 && age >= 5 && age <= 8) {
        price = 800
    }
    else if (n1 == 0 && age >= 9) {
        price = 1000
    }

    if (n2 == 0 && age < 5) {
        price = 500
    }
    else if (n2 == 0 && age >= 5 && age <= 8) {
        price = 900
    }
    else if (n2 == 0 && age >= 9) {
        price = 1200
    }

    if (n3 == 0 && age < 5) {
        price = 500
    }
    else if (n3 == 0 && age >= 5 && age <= 8) {
        price = 1000
    }
    else if (n3 == 0 && age >= 9) {
        price = 1400
    }
    document.getElementById("pri" + index).innerHTML = price;
    document.getElementById("pri" + index).value = price;
    TongGiaTien()
}
function DayformatCheckIn() {

    var today = new Date().toISOString().split('T')[0];
    document.getElementsByName("ngaycheckin")[0].setAttribute('min', today);
}
function DayformatBirth() {
    var today = new Date().toISOString().split('T')[0];
    var list = document.getElementsByClassName("dateofb");
    Array.prototype.forEach.call(list, function (el) {
        el.setAttribute('max', today);
    });
}
DayformatCheckIn()
DayformatBirth()
function TongGiaTien() {
    var tongtien = 0;
    var list = document.getElementsByClassName("pri");
    for (var i = 0; i < list.length; i++) {
        if (typeof(list[i].value) == 'undefined') { list[i].value=0}
    }
    for (var i = 0; i < list.length; i++) {
        tongtien += list[i].value;
    }
    document.getElementById("tonggiatien").value = tongtien;
    document.getElementById("tonggiatien").innerHTML = tongtien +' $';
    
}
var gotoStep = function () {
    removeBorder();
    removeShow();
    const tabitem = document.querySelector("#tab-" + 3);
    tabitem.classList.add("tab-border")
    const tabContentItem = document.querySelector("#tab-" + 3 + "-content");
    tabContentItem.classList.add('show');
}
function goStep() {
    setTimeout(function () {
            removeBorder();
            removeShow();
            const tabitem = document.querySelector("#tab-" + 3);
            tabitem.classList.add("tab-border")
            const tabContentItem = document.querySelector("#tab-" + 3 + "-content");
            tabContentItem.classList.add('show'); }, 4000);
}
