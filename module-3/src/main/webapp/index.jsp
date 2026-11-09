<%--
    Author: Kobe Alexander
    Date: November 8, 2026
    Course: CSD-430
    Assignment: Module 3 - Restaurant Feedback Form
    Purpose: Collect restaurant dining experience feedback using an HTML form.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Provide Java values to demonstrate server-side JSP scriptlets.
    String formTitle = "Restaurant Experience Feedback";
    String formDescription = "Tell us about your meal and service. Your feedback will be shown on the next page.";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= formTitle %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<main class="container">
    <header>
        <span class="eyebrow">CSD-430 · MODULE 3</span>
        <h1><%= formTitle %></h1>
        <p class="intro"><%= formDescription %></p>
    </header>

    <%-- Submit all inputs to a different JSP page using POST. --%>
    <form action="<%= request.getContextPath() %>/results.jsp" method="post" accept-charset="UTF-8">
        <fieldset>
            <legend>Visit Information</legend>

            <label for="customerName">Your name <span class="required">*</span></label>
            <input type="text" id="customerName" name="customerName" maxlength="80" placeholder="e.g., Jordan Smith" required>

            <label for="visitDate">Date of visit <span class="required">*</span></label>
            <input type="date" id="visitDate" name="visitDate" required>

            <label for="mealType">Meal type <span class="required">*</span></label>
            <select id="mealType" name="mealType" required>
                <option value="" selected disabled>Select a meal</option>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
            </select>
        </fieldset>

        <fieldset>
            <legend>Your Experience</legend>

            <span class="field-label">Food rating <span class="required">*</span></span>
            <div class="choices">
                <label><input type="radio" name="foodRating" value="1 - Poor" required> 1 - Poor</label>
                <label><input type="radio" name="foodRating" value="2 - Fair"> 2 - Fair</label>
                <label><input type="radio" name="foodRating" value="3 - Good"> 3 - Good</label>
                <label><input type="radio" name="foodRating" value="4 - Very Good"> 4 - Very Good</label>
                <label><input type="radio" name="foodRating" value="5 - Excellent"> 5 - Excellent</label>
            </div>

            <label for="serviceRating">Service rating <span class="required">*</span></label>
            <select id="serviceRating" name="serviceRating" required>
                <option value="" selected disabled>Select a rating</option>
                <option value="1 - Poor">1 - Poor</option>
                <option value="2 - Fair">2 - Fair</option>
                <option value="3 - Good">3 - Good</option>
                <option value="4 - Very Good">4 - Very Good</option>
                <option value="5 - Excellent">5 - Excellent</option>
            </select>

            <label class="checkbox-label">
                <input type="checkbox" name="wouldRecommend" value="Yes">
                I would recommend this restaurant to a friend
            </label>

            <label for="comments">Additional comments</label>
            <textarea id="comments" name="comments" rows="4" maxlength="1000" placeholder="What stood out about your visit?"></textarea>
        </fieldset>

        <button type="submit">Submit Feedback</button>
    </form>
    <p class="footnote">Fields marked * are required. This class demo only displays your submission; it does not save it.</p>
</main>
</body>
</html>
