<?php
$host = 'db';
$user = 'root';
$pass = 'rootpass';
$dbname = 'perusahaan';

$conn = new mysqli($host, $user, $pass, $dbname);
header('Content-Type: application/json');

if ($conn->connect_error) {
    die(json_encode(['error' => $conn->connect_error]));
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $result = $conn->query("SELECT * FROM pendapatan_2024");
        $data = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($data);
        break;

    case 'POST':
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $conn->prepare("INSERT INTO pendapatan_2024 (sumber, jumlah) VALUES (?, ?)");
        $stmt->bind_param("sd", $input['sumber'], $input['jumlah']);
        $stmt->execute();
        echo json_encode(['message' => 'Data ditambahkan']);
        break;

    case 'PUT':
        parse_str($_SERVER['QUERY_STRING'], $params);
        $id = $params['id'] ?? null;
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $conn->prepare("UPDATE pendapatan_2024 SET sumber=?, jumlah=? WHERE id=?");
        $stmt->bind_param("sdi", $input['sumber'], $input['jumlah'], $id);
        $stmt->execute();
        echo json_encode(['message' => 'Data diperbarui']);
        break;

    case 'DELETE':
        parse_str($_SERVER['QUERY_STRING'], $params);
        $id = $params['id'] ?? null;
        $stmt = $conn->prepare("DELETE FROM pendapatan_2024 WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        echo json_encode(['message' => 'Data dihapus']);
        break;

    default:
        echo json_encode(['error' => 'Metode tidak dikenali']);
        break;
}
$conn->close();
?>