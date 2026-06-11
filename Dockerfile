FROM tomee:latest

# Clean out the default TomEE landing pages
RUN rm -rf /usr/local/tomee/webapps/ROOT && mkdir -p /usr/local/tomee/webapps/ROOT

# Inject a beautiful, colorful HTML/CSS page into the root folder
RUN cat << 'EOF' > /usr/local/tomee/webapps/ROOT/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker Swarm Cluster Dashboard</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #c026d3 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #1f2937;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 3rem 2rem;
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 480px;
            width: 90%;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px);
        }
        .icon-container {
            font-size: 4rem;
            margin-bottom: 1rem;
            animation: float 3s ease-in-out infinite;
        }
        h1 {
            font-size: 2rem;
            color: #111827;
            margin-bottom: 0.75rem;
            font-weight: 800;
            letter-spacing: -0.025em;
        }
        p {
            color: #4b5563;
            font-size: 1.1rem;
            line-height: 1.5;
            margin-bottom: 2rem;
        }
        .status-badge {
            display: inline-flex;
            align-items: center;
            background: #dcfce7;
            color: #15803d;
            padding: 0.5rem 1.25rem;
            border-radius: 9999px;
            font-weight: 700;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .pulse-dot {
            width: 10px;
            height: 10px;
            background-color: #16a34a;
            border-radius: 50%;
            margin-right: 8px;
            animation: pulse 1.5s infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        @keyframes pulse {
            0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(22, 163, 74, 0.7); }
            70% { transform: scale(1); box-shadow: 0 0 0 8px rgba(22, 163, 74, 0); }
            100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(22, 163, 74, 0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon-container">🚀</div>
        <h1>Docker Swarm Live</h1>
        <p>Your TomEE web application build was compiled, synchronized, and deployed automatically via Jenkins CI/CD.</p>
        <div class="status-badge">
            <span class="pulse-dot"></span>
            Cluster Active
        </div>
    </div>
</body>
</html>
EOF

EXPOSE 8080
