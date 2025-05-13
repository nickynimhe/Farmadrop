<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/inicio.css">
    <style>
        /* Estilos base del sidebar y estructura principal */
        .sidebar {
            background: linear-gradient(135deg,rgb(36, 17, 203), #2575fc);
            color: white;
            height: 100vh;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            z-index: 100;
            transition: transform 0.3s;
        }
        
        .sidebar .logo {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            padding: 15px 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }

      

        .card {
        background: rgba(255, 255, 255, 0.1); /* Fondo semitransparente */
        backdrop-filter: blur(10px); /* Efecto de desenfoque */
        border-radius: 15px; /* Bordes redondeados */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra elegante */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        color: white; 
        margin: 20px; /* Agrega espacio alrededor de cada tarjeta */
        padding: 15px;
        width: 95% ;
        }

        .card:hover {
            transform: translateY(-5px); /* Efecto de elevación al pasar el mouse */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        /* Estilo para los iconos */
        .card .card-icon {
            background: linear-gradient(135deg, #6a11cb, #2575fc); /* Degradado */
            border-radius: 50%;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }

        /* Texto */
        .card-category {
            font-size: 1.2rem;
            font-weight: bold;
        }

        /* Animación al título */
        .card-title {
            font-size: 2rem;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .card:hover .card-title {
            color: #ffdd57; /* Amarillo neón */
        }


        .sidebar .nav-link {
            color: white;
            font-size: 16px;
            margin: 8px 0;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            transition: 0.3s;
        }
        
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
            text-decoration: none;
        }
        
        .sidebar .nav-link i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .main-panel {
            margin-left: 250px;
            transition: margin-left 0.3s;
            min-height: 100vh;
            background-image:url("https://plus.unsplash.com/premium_photo-1675033559419-295e2e4187f3?q=80&w=1563&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
        }
        
        .navbar {
            background: #ffffff;
            padding: 15px 25px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 25px;
        }
        
        .navbar-brand {
            font-size: 1.25rem;
            font-weight: 600;
        }
        
        /* Toggle para dispositivos móviles */
        .sidebar-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #555;
            cursor: pointer;
        }
        
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.show {
                transform: translateX(0);
            }
            
            .main-panel {
                margin-left: 0;
                width: 100%;
            }
            
            .sidebar-toggle {
                display: block;
            }
        }

        /* Contenedor de contenido para inicio.php */
        .container-fluid {
            padding: 0 25px 25px;
        }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
        <div class="logo">Farmadrop</div>
        <ul class="nav flex-column">
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'index.php' ? 'active' : ''; ?>" href="index.php"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'usuarios.php' ? 'active' : ''; ?>" href="usuarios.php"><i class="fas fa-user"></i> Usuarios</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'config.php' ? 'active' : ''; ?>" href="config.php"><i class="fas fa-cogs"></i> Configuración</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'tipo.php' ? 'active' : ''; ?>" href="tipo.php"><i class="fas fa-tags"></i> Tipos</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'presentacion.php' ? 'active' : ''; ?>" href="presentacion.php"><i class="fas fa-list"></i> Presentación</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'laboratorio.php' ? 'active' : ''; ?>" href="laboratorio.php"><i class="fas fa-hospital"></i> Laboratorios</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'productos.php' ? 'active' : ''; ?>" href="productos.php"><i class="fab fa-product-hunt"></i> Productos</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'clientes.php' ? 'active' : ''; ?>" href="clientes.php"><i class="fas fa-users"></i> Clientes</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'ventas.php' ? 'active' : ''; ?>" href="ventas.php"><i class="fas fa-cash-register"></i> Nueva Venta</a></li>
            <li><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'lista_ventas.php' ? 'active' : ''; ?>" href="lista_ventas.php"><i class="fas fa-cart-plus"></i> Historial Ventas</a></li>
        </ul>
    </div>
    <div class="main-panel">
        <nav class="navbar navbar-light">
            <div class="d-flex align-items-center">
                <button class="sidebar-toggle me-3" id="sidebarToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <span class="navbar-brand">Farmadrop</span>
            </div>
            <div>
                <a class="btn btn-outline-dark me-2" href="#" data-bs-toggle="modal" data-bs-target="#nuevo_pass">
                    <i class="fas fa-user-circle me-1"></i> Perfil
                </a>
                <a class="btn btn-danger" href="salir.php">
                    <i class="fas fa-sign-out-alt me-1"></i> Cerrar Sesión
                </a>
            </div>
        </nav>
