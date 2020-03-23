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
           /* buttonText: {
                prev: "上月",
                next: "下月",
                today: "今天",
                month: "月"
            },*/
            code: "zh-cn",
			/*buttonText:{
				today:'跳转到当天'
			},*/
            //这里是设置标题自定义的，我设置为“个人日程安排”了
           /* titleFormat:'酒店日程',*/
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
                    url: '/hotelm/Order/monthRoom.do',
                    dataType: "json",//地址 type 带参数"id="+id+"&timeOne="+from+"&timeTwo="+to,
                    data:"time="+time+"&roomId="+id,
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {
                        var events=[];
                        // 不出现异常 进行立面方
                        //  for (var i=0;i<result.length;i++) {
                        $.each(result, function (i) {
                            var item = result[i];
                            var date = getDate(item.times);//通过getDate方法将日期格式进行转化
                            // 数据处理，将返回的数据添加到events中
                            if (item.roomAmount ==0) {
                                events.push({
                                    id: item.id,
                                    // 标题，即你想展示的内容
                                    title: '',
                                    start:date,
                                    end: date


                                });
                            } else if (item.roomAmount !=0) {
                                events.push({
                                    id: item.id,
                                    // 标题，即你想展示的内容
                                    title: item.roomNumber + "\n 剩"+item.roomAmount,
                                    start: date,
                                    end: date,
									textColor:'#000'
                                });
                            }
                        });
                        callback(events);
                    }, error: function(data) {
                        alert('获取信息失败！')
                    }
                });
            },

		});
	}
	
});