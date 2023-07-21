# terraform-module-shutter-static-webapp
Shutter Static web app

### Architecture Diagram
![Architecture](shutter_architecture_diagram.drawio.png)

### Following resources are delopyed
    1) Azure static webapp
    2) CNAME Record `<appname>-shutter` pointing to static webapp url
    3) Add a TXT record to verify the domain. 
    4) Creates a secret in azure-shutter-pages github repo. 
    5) Adds custom domain to webapp   