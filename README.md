# Recipe_Menu_Management
Recipe and Menu Management Project

*Project Overview :*

This project uses XML, XSD, XSLT, and Python for managing recipes, menus, orders, and client data. It includes functionalities for validating and transforming XML data to extract relevant information, generate reports, and create structured data outputs. With XSLT, it provides a way to view data in HTML format or export it in JSON format. This project is useful for digital menu management, where recipes and orders can be dynamically queried, transformed, and presented in different formats.

*Project Structure :*

  - *XML and XSD Files :*

      - recette.xml: Contains data on recipes, menus, orders, clients, and delivery details.
      - recette.xsd: Defines the schema for validating the structure of recette.xml.
        
  - *XSLT Files :*

    Each XSLT file performs specific transformations on the XML data:

      - Scenario1.xslt: Displays all client comments for a specific recipe in a sorted HTML table based on the rating​(Scenario1).
      - Scenario2.xslt: Generates sales statistics for each menu, displaying the number of orders and total revenue in an HTML table​(Scenario2).
      - Scenario3.xslt: Shows a summary of client information, including order count, total amount spent, and the latest comment​(Scenario3).
      - Scenario4.xslt: Reorganizes the XML structure by grouping items (e.g., recipes, menus, orders, clients) under distinct parent tags for easier access and readability​(Scenario4).
      - Scenario5.xslt: Exports the data to JSON format, providing a structured and readable JSON output for integration with other systems​(Scenario5).

  - *Python Script :*
  - 
      - Traitement.py: Processes XML data using XSLT transformations and validates XML against the XSD schema. This script automates data processing, making it easier to handle multiple transformation scenarios and export options.

*Key Features :*

  - Data Validation: Ensures XML structure compliance with recette.xsd.
  - Dynamic Transformation: Uses XSLT to create various data views and formats, from HTML tables to JSON outputs.
  - Recipe and Menu Analysis: Extracts insights, like sales statistics, client feedback, and revenue data, for business intelligence.
  - Multi-Format Data Export: Provides flexibility to present data in both HTML and JSON formats.
