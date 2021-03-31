[
    {
        "entryPoint": [
            "sh",
            "-c"
        ],
        "portMappings": [
            {
                "hostPort": 80,
                "protocol": "tcp",
                "containerPort": 80
            }
        ],
        "command": [
            "/bin/sh -c \"echo '<html> <head> <title>AWS ECS EC2 App</title> <style>body {margin-top: 40px; background-color: #333; font-family: 'Roboto', sans-serif;} </style> </head><body> <div style=color:white;text-align:center> <h1>AWS ECS EC2 App</h1> <h2>Hello there!</h2> <p>Your Apache HTTP server is now running on a container in an ECS cluster of EC2 instances.</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html && httpd-foreground\""
        ],
        "cpu": 10,
        "memory": 300,
        "image": "httpd:2.4",
        "name": "app"
    }
]
