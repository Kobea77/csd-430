
<%--
    Author: Kobe Alexander
    Date: October 25, 2026
    Course: CSD-430
    Assignment: Module 1 - First JSP Application

    Purpose: Demonstrate Java, JSP, and HTML working together
    through an Apache Tomcat web application.

    Code Attribution:
    Developed with assistance from OpenAI ChatGPT (GPT-6, 2026).
    Reviewed and adapted for CSD-430 coursework.
--%>

<%-- JSP page configuration and Java imports --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    // Initialize student information and welcome message.
    String studentName = "Kobe Alexander";
    String welcomeMessage = "Welcome to my first JSP application!";

    // Retrieve and format the current server date and time.
    LocalDateTime currentDateTime = LocalDateTime.now();

    DateTimeFormatter dateTimeFormatter =
            DateTimeFormatter.ofPattern("MMMM dd, yyyy hh:mm a");

    String formattedDateTime =
            currentDateTime.format(dateTimeFormatter);

    // Perform a simple Java arithmetic calculation.
    int firstNumber = 10;
    int secondNumber = 20;
    int calculationResult = firstNumber + secondNumber;
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>CSD-430 - First JSP Application</title>

    <%-- CSS styling for the JSP webpage --%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            text-align: center;
            padding: 50px;
        }

        .container {
            background-color: white;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #2563eb;
        }

        p {
            font-size: 18px;
        }
    </style>
</head>

<body>

<main class="container">

    <%-- Display the application heading and welcome message. --%>
    <h1>My First JSP Application</h1>
    <h2><%= welcomeMessage %></h2>

    <%-- Display the student's name. --%>
    <p>
        Student: <strong><%= studentName %></strong>
    </p>

    <%-- Display the current server date and time. --%>
    <p>
        Current Server Time:
        <strong><%= formattedDateTime %></strong>
    </p>

    <%-- Display the result of the Java calculation. --%>
    <h3>Java Calculation Example</h3>

    <p>
        <%= firstNumber %> + <%= secondNumber %>
        = <strong><%= calculationResult %></strong>
    </p>

    <p>JSP, Java, and HTML are working successfully!</p>

</main>

</body>
</html>
