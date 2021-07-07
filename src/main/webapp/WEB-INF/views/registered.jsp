<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script>
        document.addEventListener("DOMContentLoaded", function () {
            let act = document.getElementById("act");
            let checked = [false, false, false, false, false, false]
            act.onkeyup = actCheck;
            function actCheck() {
                t1 = /^[A-Za-z0-9]{6,8}$/;
                let actv = act.value;
                let actMsg = document.getElementById("actMsg");
                if (t1.test(actv)) {
                    actMsg.innerHTML = "正確"
                    checked[0] = true
                } else {
                    actMsg.innerHTML = "請輸入6~8位英文及數字"
                    checked[0] = false
                }
                check();
            }
            let psd = document.getElementById("psd");
            psd.onkeyup = psdCheck;
            function psdCheck() {
                t1 = /^[A-Za-z0-9]{6,8}$/;
                let psdv = psd.value;
                let psdMsg = document.getElementById("psdMsg");
                if (t1.test(psdv)) {
                    psdMsg.innerHTML = "正確"
                    checked[1] = true
                } else {
                    psdMsg.innerHTML = "請輸入6~8位英文及數字"
                    checked[1] = false
                }
                check();
            }

            let psdc = document.getElementById("psdc");
            psdc.onkeyup = psdcCheck;
            function psdcCheck() {
                let psdv = psd.value;
                let psdcv = psdc.value;
                let psdcMsg = document.getElementById("psdcMsg");
                if (psdv == psdcv) {
                    psdcMsg.innerHTML = "正確"
                    checked[2] = true
                } else {
                    psdcMsg.innerHTML = "請輸入正確密碼"
                    checked[2] = false
                }
                check();
            }
            let name = document.getElementById("name");
            name.onkeyup = nameCheck;
            function nameCheck() {
                let namev = name.value;
                t1 = /^[A-Za-z0-9\u4e00-\u9fa5]{2,10}$/;
                let nameMsg = document.getElementById("nameMsg");
                if (t1.test(namev)) {
                    nameMsg.innerHTML = "正確"
                    checked[3] = true
                } else {
                    nameMsg.innerHTML = "請輸入2位以上英文數字或中文"
                    checked[3] = false
                }
                check();
            }
            let email = document.getElementById("email");
            email.onkeyup = emailCheck;
            function emailCheck() {
                let emailv = email.value;
                emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                let psdcMsg = document.getElementById("psdcMsg");
                if (emailRule.test(emailv)) {
                    emailMsg.innerHTML = "正確"
                    checked[4] = true
                } else {
                    emailMsg.innerHTML = "請輸入正確email格式"
                    checked[4] = false
                }
                check();
            }

            let mobilephone = document.getElementById("mobilephone");
            mobilephone.onkeyup = mobilephoneCheck;
            function mobilephoneCheck() {
                let mobilephonev = mobilephone.value;
                phoneRule = /^09[0-9]{8}$/;
                let mobilephoneMsg = document.getElementById("mobilephoneMsg");
                if (phoneRule.test(mobilephonev)) {
                    mobilephoneMsg.innerHTML = "正確"
                    checked[5] = true
                } else {
                    mobilephoneMsg.innerHTML = "請輸入正確手機號碼"
                    checked[5] = false
                }
                check();
            }
            document.getElementById("fast").onclick = function () {
                act.value = "testqq1"
                psd.value = "mbxx1234"
                psdc.value = "mbxx1234"
                name.value = "王小明"
                email.value = "test@gmail.com"
                mobilephone.value = "0988456456"
                actCheck()
                psdCheck()
                psdcCheck()
                nameCheck()
                emailCheck()
                mobilephoneCheck()
            }

            function check() {
                let checkint = 0
                for (i = 0; i < 6; i++) {
                    if (checked[i]) {
                        checkint++;
                    }
                }
                if (checkint == 6) {
                    document.getElementById("sub").disabled = false;
                } else {
                    document.getElementById("sub").disabled = true;
                }
            }
        })
    </script>
</head>

<body>
    <form action="registered" method="POST">
        <table>
            <tr>
                <td>帳號:</td>
                <td><input type="text" name="account" id="act"></td>
                <td id="actMsg"></td>
            </tr>
            <tr>
                <td>密碼:</td>
                <td><input type="password" name="password" id="psd"></td>
                <td id="psdMsg"></td>
            </tr>
            <tr>
                <td>確認密碼:</td>
                <td><input type="password" name="passwordcheck" id="psdc"></td>
                <td id="psdcMsg"></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name" id="name"></td>
                <td id="nameMsg"></td>
            </tr>
            <tr>
                <td>e-mail:</td>
                <td><input type="text" name="email" id="email"></td>
                <td id="emailMsg"></td>
            </tr>
            <tr>
                <td>手機:</td>
                <td><input type="text" name="mobilephone" id="mobilephone"></td>
                <td id="mobilephoneMsg"></td>
            </tr>
            <tr>
                <td><button type="submit" id="sub" disabled="true">送出</button></td>
                <td><button type="button" id="fast">快速完成</button></td>
            </tr>
        </table>
    </form>
</body>
</html>