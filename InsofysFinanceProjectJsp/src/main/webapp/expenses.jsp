<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Database connection variables
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    StringBuilder jsonResponse = new StringBuilder("[");

    try {
        // Database connection setup
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoysdb", "root", "root");

        // SQL query to get the data
        String sql = "SELECT MONTH(dateOfPayment) AS month, paymentType, SUM(amount) AS total " +
                     "FROM transaction WHERE userId = ? AND YEAR(dateOfPayment) = YEAR(CURDATE()) " +
                     "GROUP BY MONTH(dateOfPayment), paymentType";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, 5); // Assuming userId = 5, you can change this or retrieve from session

        rs = stmt.executeQuery();

        // Prepare JSON response for the frontend
        while (rs.next()) {
            int month = rs.getInt("month");
            String paymentType = rs.getString("paymentType");
            double total = rs.getDouble("total");

            jsonResponse.append("{")
                        .append("\"month\":").append(month).append(",")
                        .append("\"paymentType\":\"").append(paymentType).append("\",")
                        .append("\"total\":").append(total)
                        .append("},");

        }

        // Remove last comma and close the JSON array
        if (jsonResponse.length() > 1) {
            jsonResponse.deleteCharAt(jsonResponse.length() - 1);
        }
        jsonResponse.append("]");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Expenses</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        td {
            background-color: #fafafa;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Hide the table */
        table {
            display: none;
        }
    </style>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        window.onload = function() {
            // Fetch the JSON data from the server-side JSP
            var data = <%= jsonResponse.toString() %>;

            // Process and log the fetched data
            console.log(data);

            // Prepare chart data
            let months = [];
            let creditData = [];
            let debitData = [];
            
            data.forEach(item => {
                let monthIndex = months.indexOf(item.month);
                if (monthIndex === -1) {
                    months.push(item.month);
                    creditData.push(item.paymentType === "Credit" ? item.total : 0);
                    debitData.push(item.paymentType === "Debit" ? item.total : 0);
                } else {
                    if (item.paymentType === "Credit") {
                        creditData[monthIndex] += item.total;
                    } else {
                        debitData[monthIndex] += item.total;
                    }
                }
            });

            // Prepare the bar graph using Chart.js
            var ctx = document.getElementById('paymentChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: months,  // X-axis labels (months)
                    datasets: [{
                        label: 'Credit Payments',
                        data: creditData,
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }, {
                        label: 'Debit Payments',
                        data: debitData,
                        backgroundColor: 'rgba(255, 99, 132, 0.5)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        };
    </script>
</head>
<body>
    <h1>Monthly Expenses</h1>

    <!-- Table for displaying monthly expenses (now hidden) -->
    <table border="1">
        <thead>
            <tr>
                <th>Month</th>
                <th>Payment Type</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody id="expenseTableBody">
            <!-- Table rows will be populated dynamically by JavaScript -->
        </tbody>
    </table>

    <h2>Payment Bar Graph</h2>
    <canvas id="paymentChart" width="400" height="200"></canvas>

</body>
</html>
