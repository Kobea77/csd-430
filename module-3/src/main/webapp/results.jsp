<%--
    Author: Kobe Alexander
    Date: November 8, 2026
    Course: CSD-430
    Assignment: Module 3 - Restaurant Feedback Form
    Purpose: Read submitted form values and display them in a categorized HTML table.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    // Encode user-provided values before inserting them into HTML to prevent script injection.
    private String escapeHtml(String value) {
        if (value == null || value.isBlank()) {
            return "Not provided";
        }
        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>
<%
    // Read submitted values from the HTTP request, which uses UTF-8 encoding.
    request.setCharacterEncoding("UTF-8");
    boolean isSubmitted = "POST".equalsIgnoreCase(request.getMethod());

    String customerName = escapeHtml(request.getParameter("customerName"));
    String visitDate = escapeHtml(request.getParameter("visitDate"));
    String mealType = escapeHtml(request.getParameter("mealType"));
    String foodRating = escapeHtml(request.getParameter("foodRating"));
    String serviceRating = escapeHtml(request.getParameter("serviceRating"));
    String recommendation = request.getParameter("wouldRecommend") == null ? "No" : "Yes";
    String comments = escapeHtml(request.getParameter("comments"));

    // Validate required fields on the server; the browser's required attributes are not sufficient alone.
    boolean hasRequiredFields = isSubmitted
            && request.getParameter("customerName") != null
            && !request.getParameter("customerName").isBlank()
            && request.getParameter("visitDate") != null
            && !request.getParameter("visitDate").isBlank()
            && request.getParameter("mealType") != null
            && !request.getParameter("mealType").isBlank()
            && request.getParameter("foodRating") != null
            && !request.getParameter("foodRating").isBlank()
            && request.getParameter("serviceRating") != null
            && !request.getParameter("serviceRating").isBlank();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Feedback Results</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<main class="container">
    <header>
        <span class="eyebrow">CSD-430 · MODULE 3</span>
        <h1>Feedback Submission Summary</h1>
        <p class="intro">Review the information submitted through the restaurant experience form.</p>
    </header>

    <%-- Show a helpful message instead of a table for missing or incomplete submissions. --%>
    <% if (!hasRequiredFields) { %>
        <section class="message" role="alert">
            <h2>Missing form information</h2>
            <p>Please return to the form and complete the required fields before submitting.</p>
        </section>
    <% } else { %>
        <section>
            <h2>Submitted Data</h2>
            <p>Each row represents a form field, with its description and the value entered by the user. Records are grouped by topic.</p>
            <div class="table-scroll">
                <table>
                    <caption>Restaurant visit and customer experience records</caption>
                    <thead>
                        <tr>
                            <th scope="col">Field</th>
                            <th scope="col">Description</th>
                            <th scope="col">Submitted value</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="group-row"><th colspan="3" scope="rowgroup">Visit Information</th></tr>
                        <tr><th scope="row">Customer name</th><td>Name of the guest</td><td><%= customerName %></td></tr>
                        <tr><th scope="row">Visit date</th><td>Date the meal took place</td><td><%= visitDate %></td></tr>
                        <tr><th scope="row">Meal type</th><td>Meal attended</td><td><%= mealType %></td></tr>

                        <tr class="group-row"><th colspan="3" scope="rowgroup">Experience Ratings</th></tr>
                        <tr><th scope="row">Food rating</th><td>Food quality rated 1 to 5</td><td><%= foodRating %></td></tr>
                        <tr><th scope="row">Service rating</th><td>Service quality rated 1 to 5</td><td><%= serviceRating %></td></tr>
                        <tr><th scope="row">Recommendation</th><td>Whether the guest would recommend the restaurant</td><td><%= recommendation %></td></tr>

                        <tr class="group-row"><th colspan="3" scope="rowgroup">Additional Feedback</th></tr>
                        <tr><th scope="row">Comments</th><td>Written feedback about the visit</td><td class="comments"><%= comments %></td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    <% } %>

    <a class="back-link" href="<%= request.getContextPath() %>/index.jsp">← Return to feedback form</a>
    <p class="footnote">This demonstration displays submitted information without storing it in a database.</p>
</main>
</body>
</html>
