<?php
session_start();
include 'db.php';

$title = "Login";
include 'header.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $pass = $_POST['password'];

    $sql = "SELECT password FROM usuarios WHERE username=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $stmt->bind_result($hash);
    $stmt->fetch();

    if ($hash && password_verify($pass, $hash)) {
        $_SESSION['username'] = $user;
        header("Location: index.php");
    } else {
        echo "Contraseña incorrecta";
    }

    $stmt->close();
}
?>
    <h1 class="">NOTICIAS WEB</h1></br>
    <h2 class="text-center">Inicio de Sesión</h2>
    <form action="login.php" method="post">
        <div class="form-group">
            <label for="username">Usuario:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Contraseña:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
    </form>
    <br>
    <form action="register.php" method="get">
        <button type="submit" class="btn btn-secondary btn-block">Registrar</button>
    </form>
<?php include 'footer.php'; ?>

