$(document).ready(function () {
    getuser();   
});
var goodsVue = new Vue({
    el: '#navinfo',
    data: {
        navinfo: '',        
    },
    methods: {      
    }

})

function getuser() {
    $.ajax({
        type: "post",
        url: "../../services/getInfos.ashx",
        dataType: "json",       
        success: function (data) {           
            goodsVue.navinfo = data;            
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
}

function updateInfos() {
    $.ajax({
        type: "post",
        url: "../../services/updateinfo.ashx",       
        dataType: "json",
        data: {
            profilename: $("#user_profile_name").val(),
            usertel: $("#user_tel").val(),
            useradd: $("#user_address").val(),
            uremark: $("#user_profile_bio").val()
        },
        success: function (data) {
            if (data == "success") {
                alert("更新成功");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
}

