
$(document).ready(function () {
    GetDepartmentNames();
    // creates drop down list for Car and Manufacturers on load
    GetTypeOfCarData();
    GetManufacturerData();
});


// Written by Ken Evans
function GetDeptValues() {
    let onFocus = document.getElementById("chooseDepartment");
    let departmentName = onFocus.options[onFocus.selectedIndex].value;
    let dollarUS = Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
    });

    // Send an AJAX request
    $.getJSON('api/DeptSoldPurchValues?deptName=' + departmentName)
        .done(function (data) {
            console.log(data);
            document.getElementById("values").innerText = "The dept, " + departmentName + ", sold fleet vehicles worth:  " + dollarUS.format(data[0]) + 
                "\n\nThe " + departmentName + " purchased PHEV vehicles worth:  " + dollarUS.format(data[1]);
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


//Written by Dylan York
function GetTypeOfCarData() {
    // Send an AJAX request
    $.getJSON('api/GetTypeOfFuel')
        .done(function (data) {
            $.each(data, function (key, item) {
                // adds option for each fuel type
                $('<option>', { text: item, value: item }).appendTo($('#tcID'));
            });
        });
}


//Written by Dylan York
function GetManufacturerData() {
    // Send an AJAX request
    $.getJSON('api/GetManufacturer')
        .done(function (data) {
            $.each(data, function (key, item) {
                $('<option>', { text: item, value: item }).appendTo($('#mID'));
            });
        });
}


//Written by Dylan York
function getModelData() {
    let onFocus = document.getElementById("mID");
    let modelName = onFocus.options[onFocus.selectedIndex].value;

    $('#modeldetails').empty();
    $.getJSON('api/GetModelFromMaker?id=' + modelName)
        .done(function (data) {
            console.log(data);
            $('#Model').text("Car Type:")
            $.each(data, function (key, item) {
                $('<li>', { text: item.Model, value: item.Model }).appendTo($('#modeldetails'));
            })

        });
    $.getJSON('api/GetModelFromPhev?id=' + modelName)
        .done(function (data) {
            console.log(data);
            $.each(data, function (key, item) {
                $('<li>', { text: item.Model, value: item.Model }).appendTo($('#modeldetails'));
            })

        });
}


//Written by Dylan York
function getEquipmentData() {
    let onFocus = document.getElementById("tcID");
    let fuelName = onFocus.options[onFocus.selectedIndex].value;

    $('#CarCost').empty();
    $.getJSON('api/GetEquipmentFromFuel?id=' + fuelName)
        .done(function (data) {
            console.log(data);
            $('#Title').text("Equipment Type:")
            $.each(data, function (key, item) {
                $('<li>', { text: item.EquipmentType, value: item.EquipmentType }).appendTo($('#CarCost'));
            })


        });
    $.getJSON('api/GetEquipmentFromPhev?id=' + fuelName)
        .done(function (data) {
            console.log(data);
            $.each(data, function (key, item) {
                $('<li>', { text: item.EquipmentType, value: item.EquipmentType }).appendTo($('#CarCost'));
            })
        })
}
