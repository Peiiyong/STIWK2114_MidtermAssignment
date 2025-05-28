<?php
include 'db.php';

if (!isset($_POST['worker_id'])) {
    echo json_encode(["status" => "error", "message" => "Missing worker_id"]);
    exit;
}

$worker_id = $_POST['worker_id'];

$sql = "SELECT * FROM tbl_works WHERE assigned_to = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $worker_id);
$stmt->execute();
$result = $stmt->get_result();

$tasks = array();
while ($row = $result->fetch_assoc()) {
    $tasks[] = $row;
}
echo json_encode($tasks);
?>