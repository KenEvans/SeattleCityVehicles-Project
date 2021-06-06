
$(document).ready(function () {
    GetDepartmentNames();
    //GetStores();
});


// Written by Ken Evans
function GetDeptValues() {
    let onFocus = document.getElementById("chooseDepartment");
    let departmentName = onFocus.options[onFocus.selectedIndex].value;

    // Send an AJAX request
    $.getJSON('api/DeptSoldPurchValues?deptName=' + departmentName)
        .done(function (data) {
            console.log(data);
            document.getElementById("values").innerText = "Department, " + departmentName + ", sold $" + data[0] + " worth of vehicles." +
                "\nDepartment, " + departmentName + ", purchased $" + data[1] + " worth of PHEV vehicles.";
        });
}


//Written by Ken Evans
function GetDepartmentNames() {
    // Send an AJAX request
    $.getJSON("api/DepartmentNames")
        .done(function (data) {
            $.each(data, function (key, item) {
                $('<option>', { text: item, value: item }).appendTo($('#chooseDepartment'));
            });
        });
}


//// Written by Ken Evans
//function GetMarkups() {
//    // Send an AJAX request
//    $.get('api/Markups')
//        .done(function (data) {
//            $('#markup').empty();
//            console.log(data);
//            $.each(data, function (key, item) {
//                $('<li>', { text: formatItem(item) }).appendTo($('#markup'));
//            });
//        });
//}


////Written by Ken Evans
//function formatItem(item) {
//    return 'City: ' + item.City + ', Count: ' + item.Count;
//}


//function GetSalesPeople() {
//    // Send an AJAX request
//    $.getJSON("api/SalesPeople")
//        .done(function (data) {
//            $.each(data, function (key, item) {
//                $('<option>', { text: item, value: item }).appendTo($('#chooseEmployee'));
//            });
//        });
//}


//function GetStores() {
    //// Send an AJAX request
    //$.getJSON("api/Stores")
    //    .done(function (data) {
    //        $.each(data, function (key, item) {
    //            $('<option>', { text: item, value: item }).appendTo($('#chooseStore'));
    //        });
    //    });
//}


//function GetAnnualSales() {
    //let onFocus = document.getElementById("chooseEmployee");
    //let employeeName = onFocus.options[onFocus.selectedIndex].value;

    //// Send an AJAX request
    //$.getJSON('api/AnnualSales?salesPeople=' + employeeName)
    //    .done(function (data) {
    //        console.log(data);
    //        document.getElementById("getEmpSales").innerText = "This employee sold $" + data + " for the year";
    //    });
//}


//function GetStoreSales() {
    //let onFocus = document.getElementById("chooseStore");
    //let storeName = onFocus.options[onFocus.selectedIndex].value;

    //// Send an AJAX request
    //$.getJSON("api/StoreSales?storeCity=" + storeName)
    //    .done(function (data) {
    //        console.log(data);
    //        document.getElementById("storeSales").innerText = "That store sold $" + data + " for the year";
    //    });
//}
