# Project Write-ups for Your Submission

Use the following content for your application form. Each write-up is approximately 300 words and focused on the **AquaMetrics** project.

---

## (SQL) How I applied the skill for the chosen work

In the **AquaMetrics** project, I engineered a robust relational database schema designed to handle high-frequency time-series data from smart water meters. My application of SQL focused on Three primary areas: **Structural Integrity**, **Analytical Performance**, and **Business Logic Automation**.

First, I designed a normalized schema consisting of `users`, `smart_meters`, `consumption_logs`, and `billing` tables. By enforcing strict foreign key constraints and indexing strategies (specifically on `meter_id` and `logged_at` timestamps), I ensured that the database maintains referential integrity even with millions of records. This foundation was critical for a system where accurate billing and historical data retention are paramount.

Second, I implemented complex analytical queries using **Common Table Expressions (CTEs)** and advanced aggregations. A standout feature of this project is the "Leak Detection" query. It evaluates consumption patterns over a rolling 24-hour window, identifying meters with constant flow that never drops to zero—a statistical indicator of a physical leak. This demonstrates my ability to translate real-world physical phenomena into precise SQL logic.

Finally, I automated the billing lifecycle using multi-table joins and window functions. By calculating monthly consumption totals per user and applying tiered pricing logic within the query itself, I reduced the need for heavy application-layer processing. I also utilized `GROUP BY` and `DATE_FORMAT` to generate trend reports, allowing the frontend to visualize weekly and monthly spikes in demand. My work on this project reflects a professional-grade understanding of SQL, moving beyond simple CRUD operations into the realm of data engineering and automated insights.

---

## (HTML5 & Javascript & CSS3) How I applied the skill for the chosen work

The **AquaMetrics Dashboard** represents a comprehensive application of modern frontend technologies, focusing on creating a premium, data-driven user experience through **Vanilla HTML5, CSS3, and JavaScript**.

For the **structural foundation**, I utilized Semantic HTML5 to ensure maximum accessibility and SEO performance. This includes the use of `<nav>`, `<main>`, and `<section>` tags to define a clear document hierarchy, and ARIA labels for dynamic elements. The layout was built using a combination of **CSS Grid** for the overarching dashboard structure and **Flexbox** for micro-layouts, ensuring the interface is fully responsive across mobile, tablet, and desktop devices.

The **aesthetic design** follows a modern "Midnight Glassmorphic" theme. Using advanced CSS3 features such as `backdrop-filter`, `radial-gradients`, and custom property tokens (Variables), I created a high-end interface that feels both futuristic and professional. I prioritized visual excellence with subtle micro-animations; for instance, the stats cards use `@keyframes` for smooth entry, and the data visualizer bars employ `cubic-bezier` transitions to animate growth based on data state changes.

In the **logic layer (JavaScript)**, I focused on high-performance DOM manipulation without the overhead of heavy frameworks. I developed a custom charting engine that dynamically generates HTML elements representing consumption trends. The scripting handles real-time data synchronization simulations, event orchestration for navigation, and a toast notification system for user feedback. By utilizing `DOMContentLoaded` for initialization and efficient event delegation, I ensured the application remains snappy and light. This project demonstrates my proficiency in building interactive, state-aware web applications that prioritize both visual "WOW" factor and technical efficiency.
