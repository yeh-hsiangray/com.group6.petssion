<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>圖表</title>
 
 <style>
        canvas {
            margin: auto;
            width: 800px !important;
            height: 400px !important;

        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let messageBody = document.getElementById("messageBody");
            let year = document.getElementById("year");
            let month = document.getElementById("month");
            let job = document.getElementById("job");
            let downloadBody = document.getElementById("downloadBody");
            year.onclick = function () {
            	downloadBody.innerHTML =""
                year.className = "nav-link active";
                month.className = "nav-link";
                job.className = "nav-link";
                let start = 2020;
                let date = new Date().getFullYear() - start;
                con = `<table style="margin:auto;"><tr><td><select class="form-select" id="selectYear">`
                for (i = 0; i <= date; i++) {
                    con += `<option value="\${i + start}">\${i + start}</option>`
                }
                con += `</select></td><td><button type="button" class="btn btn-secondary" id="submitYear">送出</button></td></tr></table><div id="chartBady"></div>`
                messageBody.innerHTML = con
                document.getElementById("submitYear").onclick = byYear;
            };
            month.onclick = function () {
            	downloadBody.innerHTML =""
                year.className = "nav-link";
                month.className = "nav-link  active";
                job.className = "nav-link";
                let start = 2020;
                let date = new Date().getFullYear() - start;
                con = `<table style="margin:auto;"><tr><td><select class="form-select" id="selectYear">`
                for (i = 0; i <= date; i++) {
                    con += `<option value="\${i + start}">\${i + start}</option>`
                }
                con += `</select></td><td><select class="form-select" id="selectMonth">`
                for (i = 1; i < 13; i++) {
                    if (i < 10) { con += `<option value="0\${i}">\${i}</option>` } else { con += `<option value="\${i}">\${i}</option>` }
                }
                con += `</td><td><button type="button" class="btn btn-secondary" id="submitMonth">送出</button></td></tr></table><div id="chartBady"></div>`
                messageBody.innerHTML = con
                document.getElementById("submitMonth").onclick = byMonth;
            }
            job.onclick = function () {
                year.className = "nav-link";
                month.className = "nav-link";
                job.className = "nav-link active";
                con = `<div id="chartBady"></div>`
                messageBody.innerHTML = con
                fetch("byJob").
                    then(res => res.json()).then(function (data1) {
                        con = `<canvas id="myChart" ></canvas>`
                        	document.getElementById("chartBady").innerHTML = con

                        let ctx = document.getElementById("myChart");
                        let jobName = [];
                        let backgroundColor = [];
                        for (i = 0; i < data1.length; i++) {
                            jobName.push(data1[i].jobName)
                            backgroundColor.push(color());
                        }
                        let numeral = [];
                        for (i = 0; i < data1.length; i++) {
                            numeral.push(data1[i].numeral);
                        }

                        let myChart = new Chart(ctx, {
                            type: 'doughnut',
                            data: {
                                labels: jobName,
                                datasets: [{
                                    data: numeral,
                                    backgroundColor,
                                    hoverOffset: 4,
                                }],
                            },
                            options: {
                                plugins: {
                                    title: {
                                        fullSize: true,
                                        font: {
                                            size: 25
                                        },
                                        display: true,
                                        position: "bottom",
                                        text: `職業分布`
                                    }
                                },
                                responsive: true,
                                maintainAspectRatio: false,

                            }
                        });
                    })
                downloadBody.innerHTML =`<center><a class="btn btn-outline-info btn-lg btn-block"  href="downloadByJob">下載</a></center>`
            }
           
            function color() {
                let colorStr = "#";
                let randomArr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];

                for (var i = 0; i < 6; i++) {
                    colorStr += randomArr[Math.ceil(Math.random() * (15 - 0), 0)];
                }
                return colorStr;
            }
            function byMonth() {
                selectYear = document.getElementById("selectYear")
                selectMonth = document.getElementById("selectMonth")
                chartBady = document.getElementById("chartBady")
                data = {
                    year: selectYear.value,
                    month: selectMonth.value
                }
                fetch(`byMonth/\${selectYear.value}/\${selectMonth.value}`).
                    then(res => res.json()).then(function (data1) {
                        console.log(data1)
                        con = `<canvas id="myChart" ></canvas>`
                        chartBady.innerHTML = con
                        let ctx = document.getElementById("myChart");
                        let yy = [];
                        let backgroundColor = [];
                        let borderColor = [];
                        for (i = 0; i < data1.thisYear.length; i++) {
                            yy.push(data1.thisYear[i].month)
                            backgroundColor.push('rgba(0, 255, 0, 0.2)');
                            borderColor.push('rgba(0, 255, 0,0.8)');
                        }
                        let thisNumeral = [];
                        let lastNumeral = [];
                        for (i = 0; i < data1.thisYear.length; i++) {
                            thisNumeral.push(data1.thisYear[i].numeral);
                            lastNumeral.push(data1.thisYear[i].numeral - data1.lastYear[i].numeral)
                        }
                        let myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: yy,
                                datasets: [{
                                    label: '註冊人數',
                                    data: thisNumeral,
                                    backgroundColor,
                                    borderColor,
                                    borderWidth: 1
                                }, {
                                    label: '去年同期比對',
                                    data: lastNumeral,
                                    borderColor: 'rgb(54, 162, 235)',
                                    borderWidth: 1,
                                    type: 'line'
                                }]
                            },
                            options: {
                            	 plugins: {
                                     title: {
                                         fullSize: true,
                                         font: {
                                             size: 30
                                         },
                                         display: true,
                                        text: `\${selectYear.value}年\${selectMonth.value}月註冊人數`
                                    }
                            	 },
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                                }
                            }
                        });
                    })
                downloadBody.innerHTML =`<center><a class="btn btn-outline-info btn-lg btn-block"  href="downloadByMonth/\${selectYear.value}/\${selectMonth.value}/\${selectYear.value}年\${selectMonth.value}月註冊人數" >下載</a></center>`
            }

            function byYear() {
                selectYear = document.getElementById("selectYear")
                chartBady = document.getElementById("chartBady")
                download = document.getElementById("download")
                data = {
                    year: selectYear.value
                }
                fetch(`byYear/\${selectYear.value}`).
                    then(res => res.json()).then(function (data1) {
                        con = `<canvas id="myChart" ></canvas>`
                        chartBady.innerHTML = con
                        let ctx = document.getElementById("myChart");
                        let yy = [];
                        let backgroundColor = [];
                        let borderColor = [];
                        for (i = 0; i < data1.thisYear.length; i++) {
                            yy.push(data1.thisYear[i].month)
                            backgroundColor.push('rgba(0, 255, 0, 0.2)');
                            borderColor.push('rgba(0, 255, 0,0.8)');
                        }
                        let thisNumeral = [];
                        let lastNumeral = [];
                        for (i = 0; i < data1.thisYear.length; i++) {
                            thisNumeral.push(data1.thisYear[i].numeral);
                            lastNumeral.push(data1.thisYear[i].numeral - data1.lastYear[i].numeral)
                        }
                        let myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: yy,
                                datasets: [{
                                    label: '註冊人數',
                                    data: thisNumeral,
                                    backgroundColor,
                                    borderColor,
                                    borderWidth: 1
                                }, {
                                    label: '去年同期比對',
                                    data: lastNumeral,
                                    borderColor: 'rgb(54, 162, 235)',
                                    borderWidth: 1,
                                    type: 'line'
                                }]
                            },
                            options: {
                                plugins: {
                                    title: {
                                        fullSize: true,
                                        font: {
                                            size: 30
                                        },
                                        display: true,
                                        text:`\${selectYear.value}年註冊人數`
                                    }
                                },
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                                }
                            }
                        });
                    })
                downloadBody.innerHTML =`<center><a class="btn btn-outline-info btn-lg btn-block" href="downloadByYear/\${selectYear.value}/\${selectYear.value}年註冊人數" >下載</a></center>`
            }
        })
    </script>
<!--imports-->
<%@include file="../../commons/backend_imports.jsp"%>
<!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-footer-fixed">

	<!--header -->
	<%@include file="../../commons/backend_header.jsp"%>

	<!-- sidebar start -->
	<%@include file="../../commons/backend_sidebar.jsp"%>
	<!-- sidebar end -->

	<!-- content -->
 <body>
    <div class="component demo">
        <ul class="nav justify-content-center nav-tabs">
            <li class="nav-item">
                <a class="nav-link" id="year">依年份查看註冊人數</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="month">依月份查看註冊人數</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="job">查看註冊職業分布</a>
            </li>
        </ul>
    </div>
    <div id="messageBody">
    </div>
    <div id="downloadBody"></div>
	<!-- content -->

	<!--footer -->
	<%@include file="../../commons/backend_footer.jsp"%>

</body>

</html>