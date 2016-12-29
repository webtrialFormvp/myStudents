$(document).ready(function () {
    getcourse();
});
var goodsVue = new Vue({
    el: '#navinfo',
    data: {
        navinfo: '',
    },
    methods: {
    }

})


function getcourse() {
    $.ajax({
        type: "post",
        url: "../../services/getCourseInfos.ashx",
        dataType: "json",
        success: function (data) {
            goodsVue.navinfo = data;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
}
function setColor(day,dayCourse) {
    switch (day) {
        case 1:
            return getColor(dayCourse.dy1);
            break;
        case 2:
            return getColor(dayCourse.dy2);
            break;
        case 3:
            return getColor(dayCourse.dy3);
            break;
        case 4:
            return getColor(dayCourse.dy4);
            break;
        case 5:
            return getColor(dayCourse.dy5);
            break;
        case 6:
            return getColor(dayCourse.dy6);
            break;
        default:
            break;
    }

}
function getColor(isnedd)
{
    if (isnedd.Equals("必修"))
        color = "red";
    else if (isnedd.Equals(string.Empty))
    { color = "white"; }
    else
        color = "gray";
    return color;
}


