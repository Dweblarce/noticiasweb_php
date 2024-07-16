<?php
include 'db.php';

$title = "Nota";
include 'header.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo = $_POST['titulo'];
    $contenido = $_POST['contenido'];
    $video_url = $_POST['video_url'];
    $fecha = date('Y-m-d H:i:s');

    $sql = "INSERT INTO notas (titulo, contenido, video_url, fecha) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $titulo, $contenido, $video_url, $fecha);

    if ($stmt->execute()) {
        header("Location: index.php");
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT titulo, contenido, video_url, fecha FROM notas WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->bind_result($titulo, $contenido, $video_url, $fecha);
    $stmt->fetch();
    $stmt->close();
}
?>
    <?php if (isset($titulo)): ?>
        <h1 class="text-center my-4"><?php echo $titulo; ?></h1>
        <p class="text-justify"><?php echo nl2br($contenido); ?></p>
        <small class="text-muted">Publicado el: <?php echo $fecha; ?></small>
        <br><br>
        <?php if ($video_url): ?>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo extractYoutubeID($video_url); ?>" allowfullscreen></iframe>
            </div>
        <?php endif; ?>
        <br><br>
        <a href="index.php" class="btn btn-secondary btn-block">Volver a la lista de notas</a>
    <?php else: ?>
        <h1 class="text-center my-4">Agregar nueva nota</h1>
        <form action="nota.php" method="post">
            <div class="form-group">
                <label for="titulo">Título:</label>
                <input type="text" class="form-control" id="titulo" name="titulo" required>
            </div>
            <div class="form-group">
                <label for="contenido">Contenido:</label>
                <textarea class="form-control" id="contenido" name="contenido" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="video_url">URL del Video (YouTube):</label>
                <input type="text" class="form-control" id="video_url" name="video_url">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Agregar Nota</button>
        </form>
        <br>
        <a href="index.php" class="btn btn-secondary btn-block">Volver a la lista de notas</a>
    <?php endif; ?>
<?php include 'footer.php'; ?>

<?php
function extractYoutubeID($url) {
    parse_str(parse_url($url, PHP_URL_QUERY), $vars);
    return $vars['v'] ?? '';
}
?>
