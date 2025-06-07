<?php
$host = '127.0.0.1';
$db = 'sistema_gri';
$user = 'root';
$pass = '';
$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die('Erro na conexão: ' . $conn->connect_error);
}
?>