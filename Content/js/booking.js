const tabItems = document.querySelectorAll(".tab-item");
const tabContentItems = document.querySelectorAll(".tab-content-item");
function selectItem(e) {
    removeBorder();
    removeShow();
    this.classList.add("tab-border")
    const tabContentItem = document.querySelector(`#${this.id}-content`);
    tabContentItem.classList.add('show');
}
function removeShow() {
    tabContentItems.forEach(item => item.classList.remove("show"));
}
function removeBorder() {
    tabItems.forEach(item => item.classList.remove("tab-border"));
}
tabItems.forEach(item => item.addEventListener("click", selectItem));

function insertCustomer() {
    var x = document.getElementById("tablecustomers").rows.length;
    document.getElementById("tablecustomers").insertRow(-1).innerHTML = '<tr><td>' + x + '</td><td><input type="text"class="fullname"></td><td><input type="date" class="dateofb"></td><td><input type="text" class="adr"></td><td><select name="sex" class="sex"><option value="#">Male</option><option value="#">Female</option></select></td><td><select name="typecustomer" class="typecustomer"><option value="#">VietNamese</option><option value="#">Overseas Vietnamese</option><option value="#">Foreigner</option></select></td><td><input type="text" class="age"></td><td><input type="text" class="pri"></td></tr><td><button class="trash fas fa-trash"onclick="deletecustomer(this)"></button></td>';
}
function deletecustomer(x) {
    var i = x.parentNode.parentNode.rowIndex;
    document.getElementById("tablecustomers").deleteRow(i);
}
