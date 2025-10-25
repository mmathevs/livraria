<?php
$host = 'localhost';
$db = 'livraria';
$user = 'userExample';
$pass = 'passExample';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
   die('Conexão falhou: ' . $e->getMessage());
}
?>
