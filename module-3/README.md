# CSD-430 Module 3 — Restaurant Experience Feedback

Author: Kobe Alexander  
Date: November 8, 2026  
Assignment: Module 3 — JSP Form and Results

## Purpose
Collect restaurant feedback from an HTML form and display the submitted values using a **separate JSP** and an HTML table.

## Requirements covered
- Seven fields: customer name, visit date, meal type, food rating, service rating, recommendation, and comments.
- Five input types: text, date, select, radio, checkbox, and textarea (six total).
- Java is inside JSP scriptlets / declarations; HTML markup is outside Java scriptlets.
- Data is displayed in a separate results JSP as a table organized by topic, with field descriptions.
- CSS is in a separate file.
- Source files contain documentation and AI attribution.

## Files
- `src/main/webapp/index.jsp`: feedback form.
- `src/main/webapp/results.jsp`: request processing and HTML table.
- `src/main/webapp/css/styles.css`: styles shared by both JSPs.
- `pom.xml`: Maven WAR build for Java 21 and Tomcat 10.1.

## IntelliJ / Tomcat 10.1 instructions
1. Copy this directory to `G:\github\csd-430\module-3`.
2. Open `module-3/pom.xml` as a Maven project in IntelliJ.
3. Run Maven Lifecycle > clean, then package.
4. Create a Tomcat Server > Local run configuration using the existing Tomcat 10.1 installation.
5. Under Deployment add the `csd430-module3:war exploded` artifact and set the **Application context** to `/module-3`.
6. Run the configuration and browse to `http://localhost:8080/module-3/`.
7. Fill out the form and click Submit Feedback to view the result table at `/module-3/results.jsp`.

## Screenshots to submit
- Form page with the browser URL visible.
- Completed results page with table of submitted records.
- IntelliJ source of `index.jsp` and `results.jsp` showing documented Java scriptlets and HTML markup.
- `styles.css` and Tomcat deployment success (if requested).

## Attribution
Code drafted with assistance from OpenAI ChatGPT (GPT-6, 2026), then intended for review, testing, and adaptation by the student. No external code was copied.

## Notes
- This is a class exercise; it does not retain feedback after the request.
- User-provided values are HTML-escaped when displayed, to reduce cross-site scripting risk.
