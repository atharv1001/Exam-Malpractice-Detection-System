<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Session check (very important)
    Object user = session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Exam</title>

<style>
    body {
        font-family: Arial;
        background: #f5f5f5;
        padding: 20px;
    }
    .container {
        background: white;
        padding: 20px;
        width: 600px;
        margin: auto;
        border-radius: 5px;
    }
    .timer {
        color: red;
        font-weight: bold;
        float: right;
    }
</style>

<script>


    let time = 60; // exam time in seconds

    function startTimer() {
        let timer = setInterval(function () {
            document.getElementById("time").innerHTML = time;
            time--;

            if (time < 0) {
                clearInterval(timer);
                alert("Time over! Exam submitted.");
                document.getElementById("examForm").submit();
            }
        }, 1000);
    }

    // TAB SWITCH DETECTION (malpractice)
    let tabCount = 0;
    document.addEventListener("visibilitychange", function () {
        if (document.hidden) {
            tabCount++;
            console.log("Tab switched: " + tabCount);
        }
    });
    
    
    function logActivity(event) {
        fetch("logActivity", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "studentId=1&event=" + event
        });
    }

    document.addEventListener("visibilitychange", function () {
        if (document.hidden) {
            logActivity("TAB_SWITCH");
        }
    });

    
</script>

</head>

<body onload="startTimer()">

<div class="container">

    <h2>Online Exam
        <span class="timer">Time left: <span id="time">60</span>s</span>
    </h2>

    <form id="examForm" action="submitExam" method="post">

        <p><b>Q1. Java is a ______ language.</b></p>
        <input type="radio" name="q1" value="a"> Procedural<br>
        <input type="radio" name="q1" value="b"> Object Oriented<br>
        <input type="radio" name="q1" value="c"> Functional<br>
        <input type="radio" name="q1" value="d"> Assembly<br>

        <br>

        <p><b>Q2. Which is not a Java feature?</b></p>
        <input type="radio" name="q2" value="a"> Platform Independent<br>
        <input type="radio" name="q2" value="b"> Object Oriented<br>
        <input type="radio" name="q2" value="c"> Pointer<br>
        <input type="radio" name="q2" value="d"> Secure<br>

        <br>

        <button type="submit">Submit Exam</button>
    </form>

</div>

</body>
</html>
