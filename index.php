<?php
session_start();
if (!empty($_SESSION['active'])) {
    header('location: src/');
    exit;
} else {
    if (!empty($_POST)) {
        $alert = '';
        if (empty($_POST['usuario']) || empty($_POST['clave'])) {
            $alert = '<p class="alert">Ingrese usuario y contraseña</p>';
        } else {
            require_once "conexion.php";
            $user = mysqli_real_escape_string($conexion, $_POST['usuario']);
            $clave = md5(mysqli_real_escape_string($conexion, $_POST['clave']));
            $query = mysqli_query($conexion, "SELECT * FROM usuario WHERE usuario = '$user' AND clave = '$clave'");
            mysqli_close($conexion);
            
            if (mysqli_num_rows($query) > 0) {
                $dato = mysqli_fetch_array($query);
                $_SESSION['active'] = true;
                $_SESSION['idUser'] = $dato['idusuario'];
                $_SESSION['nombre'] = $dato['nombre'];
                $_SESSION['user'] = $dato['usuario'];
                header('Location: src/');
                exit;
            } else {
                $alert = '<p class="alert alert-danger">Contraseña incorrecta</p>';
                session_destroy();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="assets/css/index.css">

</head>
<body>
    <div class="container">
        <div class="container-form">
            <form class="sign-in" method="post">
                <h2>Iniciar Sesión</h2>
                <span>Use su usuario y contraseña</span>
                <?php echo isset($alert) ? $alert : ''; ?>
                <div class="container-input">
                    <ion-icon name="person-outline"></ion-icon>
                    <input type="text" name="usuario" placeholder="Usuario">
                </div>
                <div class="container-input">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="clave" placeholder="Clave">
                </div>
                <a href="#"><strong>¿Olvidaste tu contraseña?</strong></a>
                <button class="button" type="submit">INICIAR SESIÓN</button>
            </form>
        </div>

        <div class="container-welcome">
            <div class="welcome-sign-in welcome">
                <h3>¡Hola!</h3>
                <p>Regístrese con sus datos personales para usar todas las funciones del sitio</p>
                <button class="button" id="btn-sign-in">Iniciar Sesión</button>
            </div>
        </div>
    </div>

    <script src="assets/js/index.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>