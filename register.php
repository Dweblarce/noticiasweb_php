<?php
include 'db.php';

$title = "Registro";
include 'header.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $pass = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $sql = "INSERT INTO usuarios (username, password) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $pass);

    if ($stmt->execute()) {
        header("Location: login.php");
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}
?>
    <h2 class="text-center">Registro de Usuario</h2>
    <form action="register.php" method="post">
        <div class="form-group">
            <label for="username">Usuario:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Contraseña:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Registrarse</button>
    </form>
    <br>
    <a href="login.php" class="btn btn-secondary btn-block">Volver al Login</a>
<?php include 'footer.php'; ?>


