function searchBar(id, input){
    let table = document.querySelector(id);
    let row = table.querySelectorAll('tr');
    let contain = false;

    for(let i=1;i<row.length;i++){
        let data = row[i].querySelectorAll('td');
        for(let j=0;j<data.length-1;j++){
            contain = false;
            if(data[j].textContent.includes(input.value) || data[j].textContent.toUpperCase().includes(input.value.toUpperCase())){
                contain = true;
                break;
            }
        }
        if(!contain) row[i].style.display = 'none';
        else row[i].style.display = ''; 
    }
}
function searchBarList(id, input){
    let ul = document.querySelectorAll(id);
    let contain = false;

    for(let i=0;i<ul.length;i++){
        let li = ul[i].querySelectorAll('li');

        for(let j=0;j<li.length;j++){
            let a = li[j].querySelector('a');
            contain = false;

            if(a.textContent.includes(input.value) || a.textContent.toUpperCase().includes(input.value.toUpperCase())){
                contain = true;
                break;
            }
        }
        if(!contain) ul[i].parentElement.parentElement.style.display = 'none';
        else ul[i].parentElement.parentElement.style.display = '';
    }
}
function showPasswordEye(doc, id){
    let eye = document.querySelector(id);

    if(doc.value.length > 0) eye.classList.remove('hide');
    else eye.classList.add('hide');
}
function showSinglePassword(doc, id){
    let pwd1 = document.querySelector(id);  
    let url = doc.getAttribute('src');
    let newUrl;
    
    if(url.includes('hide-password')){
        newUrl = url.replace('hide-password', 'show-password');
        doc.setAttribute('src', newUrl);
        pwd1.type = 'text';
    }else{
        newUrl = url.replace('show-password', 'hide-password');
        doc.setAttribute('src', newUrl);
        pwd1.type = 'password';
    }
}
function showDoublePassword(doc, pass1ID, pass2ID){
    let pwd1 = document.querySelector(pass1ID);
    let pwd2 = document.querySelector(pass2ID);

    if(doc.checked){
        pwd1.type = 'text';
        pwd2.type = 'text';
    }else{
        pwd1.type = 'password';
        pwd2.type = 'password';
    }
}
function showDeleteForm(doc, id, pass){
    let form = document.querySelector(id);
    let passID = document.querySelector(pass);
    
    form.classList.remove('hide');
    passID.value = doc.getAttribute('data-id');
}
function hideDeleteForm(id){
    let form = document.querySelector(id);
    form.classList.add('hide');
}
function navigate(url){
    if(url == '')return;
    location.href = url;
}
function insertImage(doc,imgContainer){
    let image = document.querySelector(imgContainer);
    let file = new FileReader();
    file.addEventListener('load',()=>{
         image.src=`${file.result}`;
     })
    file.readAsDataURL(doc.files[0]);
}
function logoutPopup(id){
    let account = document.querySelector(id);
    if(account.classList.contains('hide')) account.classList.remove('hide');
    else account.classList.add('hide');
}
let subNavSelected = false;
let prevSubNav = null;
function subNav(id){
    if(id == '') return;
    let subNav = document.querySelector(id);
    if(subNav.classList.contains('-left-1/4')){
        if(prevSubNav != null) prevSubNav.classList.replace('push-left', '-left-1/4');
        subNav.classList.replace('-left-1/4', 'push-left');
        subNavSelected = true;
    }else if(subNav.classList.contains('push-left')){
        subNav.classList.replace('push-left', '-left-1/4');
        subNavSelected = false;
    }
    prevSubNav = subNav;
}
function previewProduct(doc){
    let id = doc.getAttribute('data-id');
    let img = doc.querySelector('img');
    let name = doc.getAttribute('data-name');
    let stock = parseInt(doc.getAttribute('data-stock'));
    let qnty = parseInt(doc.getAttribute('data-quantity'));
    let amnt = doc.getAttribute('data-amount');
    let size = doc.getAttribute('data-size');
    let cost = doc.getAttribute('data-cost');

    let previewImg = document.querySelector('.preview-image');
    let previewName = document.querySelector('.preview-name');
    let previewQnty = document.querySelector('.preview-quantity');
    let previewAmnt = document.querySelector('.preview-amount');
    let previewSize = document.querySelector('.preview-size');
    let previewCost = document.querySelector('.preview-cost');
    let subtract = document.querySelector('.subtract');
    let addButton = document.querySelector('.add-button');
    let add = document.querySelector('.add');

    if(!stock){
        alert('out of stock');
        return;
    }

    previewImg.src = img.src;
    previewName.value = name;
    previewQnty.value = qnty;
    previewAmnt.value = amnt;
    previewSize.value = size;
    previewCost.value = cost;

    subtract.setAttribute('data-price', amnt);
    add.setAttribute('data-price', amnt);
    addButton.setAttribute('data-id', id);
}
function clearPreview(type){
    let previewImg = document.querySelector('.preview-image');
    let previewQnty = document.querySelector('.preview-quantity');
    let previewAmnt = document.querySelector('.preview-amount');
    let previewSize = document.querySelector('.preview-size');
    let previewCost = document.querySelector('.preview-cost');

    let url;
    if(type == 'user') url = 'img/no-product.jpg';
    else url = '../img/no-product.jpg';
    previewImg.src = url;
    previewQnty.value = null;
    previewAmnt.value = null;
    previewSize.value = null;
    previewCost.value = null;
}
function calculateAmount(operator, doc){
    let previewQnty = document.querySelector('.preview-quantity');
    let previewAmnt = document.querySelector('.preview-amount');
    let quantity = parseInt(previewQnty.value);

    if(previewQnty.value == '') return;
    if(operator == 'add'){
        quantity++;
        previewQnty.value = quantity;
    }else if(quantity != 0){
        quantity--;
        previewQnty.value = quantity;
    } 
    let total = parseFloat(doc.getAttribute('data-price')) * quantity;
    previewAmnt.value = total.toFixed(2);
}
let total = 0, totalTax, totalBill, totalCost = 0;
let orders = [];
function addOrder(doc, type){
    let id = doc.getAttribute('data-id');
    let previewQnty = document.querySelector('.preview-quantity');
    let previewName = document.querySelector('.preview-name');
    let previewAmnt = document.querySelector('.preview-amount');
    let previewSize = document.querySelector('.preview-size');
    let previewCost = document.querySelector('.preview-cost');
    let orderList = document.querySelector('.order-list');
    let orderBill = document.querySelector('.order-bill');
    let orderTax = document.querySelector('.order-tax');
    let orderCost = document.querySelector('.order-cost');
    let orderListText = document.querySelector('.order-list-text');
    let orderPriceText = document.querySelector('.order-price-text');

    let order = document.querySelector('.order');
    let amount = document.querySelector('.amount');
    let tax = document.querySelector('.tax');
    let bill = document.querySelector('.bill');

    if(previewQnty.value == '') return;

    total += parseFloat(previewAmnt.value);
    totalTax = total * 0.02;
    totalBill = total + totalTax;
    totalCost += parseFloat((previewCost.value * previewQnty.value).toFixed(2));

    order.textContent += `${previewQnty.value} ${previewSize.value} ${previewName.value}\n`;
    amount.textContent += `${previewAmnt.value}\n`;
    tax.textContent = totalTax.toFixed(2);
    bill.textContent = `Php ${totalBill.toFixed(2)}`;

    let orderObj = {
        productID: id,
        productQnty: previewQnty.value
    };

    orders.push(JSON.stringify(orderObj));
    orderList.value = JSON.stringify(orders);
    orderBill.value = totalBill.toFixed(2);
    orderListText.value = order.textContent;
    orderPriceText.value = amount.textContent;
    orderCost.value = totalCost.toFixed(2);
    orderTax.value = tax.textContent;
    clearPreview(type); 
}
function submitOrder(e){
    let order = document.querySelector('.order-list');
    let bill = document.querySelector('.order-bill');

    if(order.value == '' || bill.value == '') e.preventDefault();
}
function clearOrder(){
    let order = document.querySelector('.order');
    let amount = document.querySelector('.amount');
    let tax = document.querySelector('.tax');
    let bill = document.querySelector('.bill');
    let orderList = document.querySelector('.order-list');
    let orderBill = document.querySelector('.order-bill');
    let orderCost = document.querySelector('.order-cost');

    order.textContent = null;
    amount.textContent = null;
    tax.textContent = '0.00';
    bill.textContent = 'Php 0.00';
    orderList.value = '';
    orderBill.value = '';
    orderCost.value = '';

    total = 0;
}
function showUser(doc, id){
    let employee = doc.parentElement.parentElement.parentElement;
    let form = document.querySelector(id);
    form.classList.remove('hide');

    let userID = employee.getAttribute('data-id');
    let image = employee.getAttribute('data-image');
    let fullname = `${employee.getAttribute('data-firstname')} ${employee.getAttribute('data-lastname')}`;
    let email = employee.getAttribute('data-email');
    let gender = employee.getAttribute('data-gender');
    let number = employee.getAttribute('data-number');
    let password = employee.getAttribute('data-password');
    let address = employee.getAttribute('data-address');
    let accountEnabled = employee.getAttribute('data-account-enabled');
    let accountActive = employee.getAttribute('data-account-active');
    let date= employee.getAttribute('data-date-created');
    let time= employee.getAttribute('data-time-created');

    document.querySelector('.set-id').textContent = userID;
    document.querySelector('.set-image').src = `../img/uploaded/${image}`;
    document.querySelector('.set-fullname').textContent = fullname;
    document.querySelector('.set-email').textContent = email;
    document.querySelector('.set-gender').textContent = gender;
    document.querySelector('.set-number').textContent = number;
    document.querySelector('.set-password').textContent = password;
    document.querySelector('.set-address').textContent = address;
    document.querySelector('.set-account-enabled').textContent = accountEnabled;
    document.querySelector('.set-account-active').textContent = accountActive;
    document.querySelector('.set-date').textContent = date;
    document.querySelector('.set-time').textContent = time;
}
function hideForm(id){
    let form = document.querySelector(id);
    form.classList.add('hide');
}
if(location.href.includes('admin')){
    addEventListener('mousemove',(e)=>{
        let adminSideNav = document.querySelector('#admin-side-nav');
        if(e.clientX == 0) adminSideNav.classList.replace('-left-14', 'left-0');
        else if(e.clientX > 60 && !subNavSelected) adminSideNav.classList.replace('left-0', '-left-14');
    });
}

let pie;
function pieChart(form){ 
    fetch('../admin/admin-get-sales.php', {method: 'post', body: form}).then(res=>res.json()).then(text=>{
        const ctx = document.getElementById('pie').getContext('2d');    
        pie = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Expenses', 'Tax', 'Income'],
                datasets: [{
                    label: '# of Votes',
                    data: [text['pieExpenses'], text['pieTax'], text['pieIncome']],
                    backgroundColor: [
                        'rgb(255,215,0)',
                        'rgba(0,0,0,0.9)',
                        'rgb(75,0,130)'
                    ],
                    borderColor: [
                        'rgb(255,215,0)',
                        'rgba(0,0,0,0.9)',
                        'rgb(75,0,130)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            
            }
        });
    });
}

let line;
function lineChart(form){
    fetch('../admin/admin-get-sales.php', {method: 'post', body: form}).then(res=>res.json()).then(text=>{
        const ctx = document.getElementById('line').getContext('2d');    
        line = new Chart(ctx, {
            type: 'line',
            data: {
                labels: text.lineHorizontalArray,
                datasets: [{
                    label: '# of Votes',
                    data: text.lineVerticalArray,
                    backgroundColor: [
                        'rgb(255,0,0)'
                    ],
                    borderColor: [
                        'rgb(255,0,0)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            
            }
        });
    });
}
function drawChart(){
    pie.destroy();
    line.destroy();
    
    let option = document.querySelector('#option-select');
    let form = new FormData();
    form.append('sales-submit','1');
    form.append('option', option.value);

    pieChart(form);
    lineChart(form);
}
if(location.href.includes('admin-sales.php')){
    let option = document.querySelector('#option-select');
    let form = new FormData();
    form.append('sales-submit','1');
    form.append('option', option.value);

    pieChart(form);
    lineChart(form);
}
