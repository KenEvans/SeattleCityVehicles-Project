

// url for performing database api functions


$(document).ready(function () {
    // creates drop down list for Car and Manufacturers on load
    GetTypeOfCarData();
    GetManufacturerData();
   
});

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
function GetManufacturerData() {
    // Send an AJAX request
    $.getJSON('api/GetManufacturer')
        .done(function (data) {
            $.each(data, function (key, item) {
                $('<option>', { text: item, value: item }).appendTo($('#mID'));
            });
        });
   
}


function getModelData() {
    let onFocus = document.getElementById("mID");
    let modelName = onFocus.options[onFocus.selectedIndex].value;

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
                $('<li>', { text: item.Model, value: item.Model}).appendTo($('#modeldetails'));
            })

        });
     
}

function getEquipmentData() {
    let onFocus = document.getElementById("tcID");
    let fuelName = onFocus.options[onFocus.selectedIndex].value;

    $.getJSON('api/GetEquipmentFromFuel?id=' + fuelName)
        .done(function (data) {
            console.log(data);
            $('#Title').text("Equipment Type:")
            $.each(data, function (key, item) {
                $('<li>', { text: item.EquipmentType, value: item.EquipmentType}).appendTo($('#CarCost'));
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










