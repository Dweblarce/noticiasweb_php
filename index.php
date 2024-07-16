<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

$title = "Notas";
include 'header.php';

$sql = "SELECT id, titulo, contenido, fecha FROM notas";
$result = $conn->query($sql);
?>
    <h1 class="text-center">Notas</h1>
    <a href="logout.php" class="btn btn-danger btn-block mb-4">Cerrar Sesión</a>
    <?php
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "<h2><a href='nota.php?id=" . $row["id"] . "'>" . $row["titulo"] . "</a></h2>";
            echo "<small>Publicado el: " . $row["fecha"] . "</small><hr>";
        }
    } else {
        echo "<p class='text-center'>No hay notas disponibles.</p>";
    }
    ?>
    <h2 class="text-center mt-4">Agregar nueva nota</h2>
    <form action="nota.php" method="post">
        <div class="form-group">
            <label for="titulo">Título:</label>
            <input type="text" class="form-control" id="titulo" name="titulo" required>
        </div>
        <div class="form-group">
            <label for="contenido">Contenido:</label>
            <textarea class="form-control" id="contenido" name="contenido" required></textarea>
        </div>
        <div class="form-group">
            <label for="video_url">URL del Video (YouTube):</label>
            <input type="text" class="form-control" id="video_url" name="video_url">
        </div>
        <button type="submit" class="btn btn-primary btn-block">Agregar Nota</button>
    </form>
<?php include 'footer.php'; ?>
