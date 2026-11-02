<%--
    Author: Kobe Alexander
    Date: November 1, 2026
    Course: CSD-430
    Assignment: Module 2 - Dynamic JSP Data Table
    Purpose: Display grouped Mistborn character records using Java scriptlets and an HTML table.

    Source: Sanderson, B. (n.d.). The Mistborn Saga - The Original Trilogy.
    https://www.brandonsanderson.com/pages/the-mistborn-saga-the-original-trilogy
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Describe the selected book and table fields.
    String bookTitle = "Mistborn: The Final Empire";
    String bookAuthor = "Brandon Sanderson";
    String bookDescription = "A fantasy heist story about rebellion, trust, and Allomancy in the Final Empire.";
    String tableDescription = "Each record identifies a character or group, their role, and their connection to the story.";

    // Store five allied character records: name, role, and description.
    String[][] allies = {
        {"Vin", "Main protagonist", "A young thief who discovers her Mistborn abilities."},
        {"Kelsier", "Rebellion leader", "A skilled Mistborn who organizes a plan against the empire."},
        {"Sazed", "Scholar and mentor", "A Terris Keeper who preserves knowledge and guides the crew."},
        {"Elend Venture", "Nobleman", "A thoughtful nobleman who questions the empire's social order."},
        {"Marsh", "Kelsier's brother", "A serious-minded ally with ties to the rebellion."}
    };

    // Store two opposing force records using the same three fields.
    String[][] opposition = {
        {"The Lord Ruler", "Empire's ruler", "The seemingly immortal ruler who dominates the Final Empire."},
        {"Steel Inquisitors", "Imperial enforcers", "Feared agents who enforce the Steel Ministry's authority."}
    };

    // Calculate the total number of data records to show on the page.
    int totalRecords = allies.length + opposition.length;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module 2 | Mistborn Character Guide</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <main class="page">
        <header class="hero">
            <p class="eyebrow">CSD-430 / MODULE 2 / JSP SCRIPTLETS</p>
            <h1>Mistborn Character Guide</h1>
            <p class="subtitle"><%= bookTitle %> by <%= bookAuthor %></p>
            <p class="summary"><%= bookDescription %></p>
        </header>

        <section class="details" aria-label="Dataset information">
            <div><span class="detail-label">Subject</span><strong>Book characters</strong></div>
            <div><span class="detail-label">Categories</span><strong>Allies &amp; Opposition</strong></div>
            <div><span class="detail-label">Records</span><strong><%= totalRecords %></strong></div>
        </section>

        <section class="table-section" aria-labelledby="table-title">
            <h2 id="table-title">Characters of the Final Empire</h2>
            <p class="table-description"><%= tableDescription %></p>
            <div class="table-scroll">
                <table>
                    <caption>Seven records organized into two topical categories. Fields: name, role, and description.</caption>
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Role</th>
                            <th scope="col">Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="group-row"><th colspan="3" scope="rowgroup">Heroes &amp; Allies</th></tr>
                        <% // Render each ally record; all HTML remains outside Java scriptlets.
                           for (String[] ally : allies) { %>
                        <tr>
                            <th scope="row"><%= ally[0] %></th>
                            <td><%= ally[1] %></td>
                            <td><%= ally[2] %></td>
                        </tr>
                        <% } %>
                        <tr class="group-row"><th colspan="3" scope="rowgroup">Opposition &amp; Authority</th></tr>
                        <% // Render each opposition record using the same table format.
                           for (String[] opponent : opposition) { %>
                        <tr>
                            <th scope="row"><%= opponent[0] %></th>
                            <td><%= opponent[1] %></td>
                            <td><%= opponent[2] %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
        <footer>
            <p>Student: Kobe Alexander · Bellevue University · Module 2</p>
            <p>Book reference: <a href="https://www.brandonsanderson.com/pages/the-mistborn-saga-the-original-trilogy">Brandon Sanderson — The Original Trilogy</a></p>
        </footer>
    </main>
</body>
</html>
