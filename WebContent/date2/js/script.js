$(document).ready(function(){

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    function UrlSearch() { //获取url里面的参数
        var name, value;
        var str = location.href; //取得整个地址栏
        var num = str.indexOf("?")
        str = str.substr(num + 1); //取得所有参数   stringvar.substr(start [, length ]
        var arr = str.split("="); //各个参数放到数组里
        return arr[1];
    }
    function getDate(DBTime){
        var date = new Date(DBTime*1000);
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var dateStr;
        if(month<10&&day<10){
            dateStr = year+"-0"+month+"-0"+day;
        }else if(month<10&&day>=10){
            dateStr = year+"-0"+month+"-"+day;
        }else if(month>=10&&day<10){
            dateStr = year+"-"+month+"-0"+day;
        }else if(month>=10&&day>=10){
            dateStr = year+"-"+month+"-"+day;
        }
        return dateStr;
    }
	if($('.calendar').length > 0){
		$('.calendar').fullCalendar({
			header: {
				left: 'prev,next,today',
				center: 'title',
				right: 'month'
			},
            code: "zh-cn",
            locale:'zh-cn',
            editable: true,
            themeSystem:'bootstrap3',
			events:function (start, end, callback) {
			var id=UrlSearch();
			var time=getNowFormatDate();
                // 这里是ajax请求，替换为你正在使用的ajax方式就可以
                $.ajax({
                    cache:false,                                       //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "post",
                    url: '/hotelm/WholeHotel/monthRoom.do',
                    dataType: "json",//地址 type 带参数"id="+id+"&timeOne="+from+"&timeTwo="+to,
                    data:"time="+time+"&typeid="+id,
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {
                        var events=[];
                        // 不出现异常 进行立面方
                        //  for (var i=0;i<result.length;i++) {
                        $.each(result, function (i) {
                            var item = result[i];
                            var date = getDate(item.times);//通过getDate方法将日期格式进行转化
                            // 数据处理，将返回的数据添加到events中
                                events.push({
                                    id: item.surplus,
                                    // 标题，即你想展示的内容
                                    title:item.surplus+'间',
                                    start:date,
                                    end: date
                                });
                        });
                        callback(events);
                    }, error: function(data) {
                        alert('获取信息失败！')
                    }
                });
            },
            /*eventClick: function(event) {
                var id=event.id;//id
                console.log(id);
            },*/
            /*dayClick: function(date, jsEvent, view) {//日程区块，单击时触发
               /!* var id=UrlSearch();
                console.log(id);
                opens(id);*!/
            }*/

		});
	}
	/*window.opens=function (id) {
        layer.prompt({
            formType: 2,
            value: '',
            title: '房间床位数',
            area: ['50px', '40px'] //自定义文本域宽高
        }, function (value, index, elem) {
            if (value==null || value.trim().length==0){
                alert("格式不正确")
                return;
            }
           /!* window.location="/hotelm/RoomSet/updateAcount.do?id="+id+"&roomAcount="+value;*!/
            $.ajax({
                cache: false,
                type: "post",
                url: "/hotelm/RoomSet/updateAcount.do",
                data:"id="+id+"&roomAcount="+value,
                async: false,
                success: function(res) {
                    //加载刷新父类页面并关闭弹窗
                    /!*window.parent.location.reload();*!/
                  /!*  parent.layer.closeAll(); //关闭弹窗*!/
                    if (res==0){//修改失败
                    alert("修改失败，请查看入住人数是否大于您本次修改床位数")
                    }
                    window.location.reload();
                }
            })
        })
    }*/

});