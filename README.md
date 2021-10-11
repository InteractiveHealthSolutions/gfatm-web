=== Global Fund TB - Web Applications ===
+ Contributors: IHS
+ Software Type: Free, Open-source
+ Requires: Microsoft Windows 7 or higher OR Ubuntu 12.04 or higher, Oracle Java Runtime Environment (JRE) v7.0 or higher, Eclipse Helios or higher License: GPLv3

== Description ==
- Generic Web application for GFATM projects

== Deployment Requirement ==
1. Install Oracle Java v7.0.x or higher 
2. Install tomcat v6.0.x
3. Install MySQL Server v5.0 or higher

== Code Setup Requirement ==
+ Java v7.0.x or higher 
+ Eclipse Helios or higher
+ GWT SDK 2.6.1

== Database ==
- gfatm.sql

== Configuration ==
- Import project to Eclipse (Make sure you have appropriate GWT plugin installed.)
- Build Path for scr, res folder  (right click on folder -> Build Path -> Use as  source folder)
- Build Path for all libraries in folder /war/WEB-INF/lib/ (right click on folder -> Build Path -> Add to build Path)
- Add GWT 2.6.1, JDK 1.7.0, JUnit to Build Path (Right click project -> Properties -> JAVA build Path -> Libraries)
- Update DB credentials in hibernate.cfg.xml
- antwebbuilder.xml -> Run as ANT Build

== Usage (Webservices for GFATM Mobile) ==
- AicWebServices
   + handles all requests from AIC mobile app
- FastWebServices
   + handles fast-screening submission
   + handles ztts enumeration form
- GfatmTasksWebServices
   Handles functionlaties that can't be handled through REST API
   + Advnace patient search
   + Feedback form
   + Get Locations
