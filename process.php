<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "abc_company";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .message-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            text-align: center;
        }
        .success {
            color: #4CAF50;
            font-weight: bold;
        }
        .error {
            color: #e74c3c;
            font-weight: bold;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="message-container">';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $po_no = $_POST['po_no'];
    $po_date = $_POST['po_date'];
    $emp_code = $_POST['emp_code'];
    $supp_no = $_POST['supp_no'];
    $action = $_POST['action'];

    if ($action === 'insert') {
        $sql = "INSERT INTO Table_01 (PO_No, PO_Date, Emp_Code, Supp_No) VALUES ($po_no, '$po_date', '$emp_code', $supp_no)";
        if ($conn->query($sql) === TRUE) {
            echo "<p class='success'>New record created successfully!</p>";
        } else {
            echo "<p class='error'>Error creating record: " . $conn->error . "</p>";
        }
    }

    elseif ($action === 'update') {
        $sql = "UPDATE Table_01 SET 
                PO_Date = '$po_date',
                Emp_Code = '$emp_code',
                Supp_No = $supp_no
                WHERE PO_No = $po_no";
        if ($conn->query($sql) === TRUE) {
            echo "<p class='success'>Record updated successfully!</p>";
        } else {
            echo "<p class='error'>Error updating record: " . $conn->error . "</p>";
        }
    }
}

echo '<a href="index.html">Go back to the form</a>';
echo '</div></body></html>';

$conn->close();
?>
