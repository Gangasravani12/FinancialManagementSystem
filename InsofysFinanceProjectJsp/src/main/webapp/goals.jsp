<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Goal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }
        .form-container {
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group input, .form-group button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group button {
            background-color: #28a745;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
        }
        .form-link {
            text-align: center;
            margin-top: 15px;
        }
        .form-link a {
            color: #007bff;
            text-decoration: none;
        }
        .form-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Goal</h2>
        <form action="saveGoal.jsp" method="post">
            <div class="form-group">
                <label for="userId">User ID:</label>
                <input type="text" id="userId" name="userId" placeholder="Enter your User ID" required>
            </div>
            <div class="form-group">
                <label for="goal">Goal Name:</label>
                <input type="text" id="goal" name="goal" placeholder="Enter your Goal Name" required>
            </div>
            <div class="form-group">
                <label for="goal_amount">Goal Amount:</label>
                <input type="number" id="goal_amount" name="goal_amount" step="0.01" placeholder="Enter Goal Amount (e.g., 10000.00)" required>
            </div>
            <div class="form-group">
                <label for="start_date">Start Date:</label>
                <input type="date" id="start_date" name="start_date" required>
            </div>
            <div class="form-group">
                <label for="target_date">Target Date:</label>
                <input type="date" id="target_date" name="target_date" required>
            </div>
            <div class="form-group">
                <button type="submit">Submit Goal</button>
            </div>
        </form>
        <div class="form-link">
            <a href="viewgoals.jsp">View Existing Goals</a>
        </div>
    </div>
</body>
</html>
