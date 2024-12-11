drop database if exists STEM;
create database STEM;
use STEM;

create table Usuario(
id_usuario int primary key auto_increment,
correo_electronico_usuario varchar(90),
user_name_usuario varchar(30),
nombre_usuario varchar(30),
apellido_usuario varchar (30),
edad_usuario int,
contrasena_usuario varchar(16), 
telefono_usuario varchar(20)
);

create table CambiosUsuario(
id_cambio int primary key auto_increment,
id_usuario int,
tipo_dato_cambio varchar (100),
dato_anterior varchar (100),
dato_nuevo varchar (100),
fecha_de_cambio date,
foreign key (id_usuario) references Usuario(id_usuario)
);

create table DireccionEnvio(
id_direccion_envio int primary key auto_increment,
nombre_envio varchar(50),
apellidos_envio varchar(100),
correo_electronico varchar(100),
pais varchar(50),
estado varchar(50),
calle varchar(200),
numero_interior varchar(20),
numero_exterior varchar(20),
colonia varchar(200),
codigo_postal int,
alcaldia_municipio varchar(200),
telefono_contacto varchar(30), 
id_usuario int,
foreign key (id_usuario) references Usuario(id_usuario)
);

create table Envio(
id_envio int primary key auto_increment,
id_usuario int,
id_direccion_envio int,
monto_envio int,
fecha_envio date,
estado_envio varchar(100),
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_direccion_envio) references DireccionEnvio(id_direccion_envio)
);

create table RegistroServicioALCliente(
id_registro_servicio_al_cliente int primary key auto_increment,
id_usuario int,
descripcion_servicio_al_cliente varchar(200),
fecha_registro_servicio_al_cliente date,
foreign key (id_usuario) references Usuario(id_usuario)
);

create table Robot(
id_robot int primary key auto_increment,
codigo_tutorial varchar(20),
precio_robot int,
descripcion_robot varchar(200)
);

create table RobotsEnCarrito(
id_carrito int primary key auto_increment,
id_usuario int,
id_robot int,
cantidad int,
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_robot) references Robot(id_robot)
);

create table Tutorial(
id_tutorial int primary key auto_increment,
descripcion_tutorial varchar(200),
duracion_tutorial int
);

create table AvanceTutorial(
id_avance_tutorial int primary key auto_increment,
id_usuario int,
id_robot int,
id_tutorial int,
codigo_tutorial varchar(20),
avance_tutorial int,
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_robot) references Robot(id_robot),
foreign key (id_tutorial) references Tutorial(id_tutorial)
);

create table Compra(
id_compra int primary key auto_increment,
id_usuario int,
id_envio int,
id_robot int,
fecha_compra date,
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_envio) references Envio(id_envio),
foreign key (id_robot) references Robot(id_robot)
);

create table Pago(
id_pago int primary key auto_increment,
id_compra int,
monto_pago int,
fecha_pago date,
estado_pago varchar(15),
forma_pago varchar(30),
foreign key (id_compra) references Compra(id_compra)
); 

DELIMITER //
CREATE PROCEDURE InsertarUsuario(
    IN p_correo VARCHAR(50),
    IN p_user_name VARCHAR(50),
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_edad INT,
    IN p_contrasena VARCHAR(50),
    IN p_telefono VARCHAR(20)
)
BEGIN 
    DECLARE correo_existente INT;
    DECLARE v_id_usuario INT;

    -- Verificar si el correo ya está registrado
    SELECT COUNT(*) INTO correo_existente 
    FROM Usuario 
    WHERE correo_electronico_usuario = p_correo;
    
    IF correo_existente = 0 THEN
        -- Insertar nuevo usuario
        INSERT INTO Usuario (correo_electronico_usuario, user_name_usuario, nombre_usuario, apellido_usuario, edad_usuario, contrasena_usuario, telefono_usuario) 
        VALUES (p_correo, p_user_name, p_nombre, p_apellido, p_edad, p_contrasena, p_telefono);

        -- Obtener el id del usuario insertado
        SELECT LAST_INSERT_ID() INTO v_id_usuario;

        -- Mensaje de éxito con el id del usuario
        SELECT 'Usuario registrado correctamente.' AS Mensaje, v_id_usuario AS id_usuario;
    ELSE
        -- Mensaje de error si el correo ya está registrado
        SELECT 'El correo ya está registrado.' AS Mensaje;
    END IF;
END//

CREATE PROCEDURE ValidRUsuario(
	IN p_correo VARCHAR(50),
    IN p_contrasena VARCHAR(50)
)
BEGIN 
	DECLARE correo_existente INT;
    DECLARE contrasena_correcta VARCHAR(50);
    SELECT COUNT(*) INTO correo_existente FROM Usuario WHERE correo_electronico_usuario = p_correo;
    
    IF correo_existente = 1 THEN
		SELECT contrasena_usuario INTO contrasena_correcta FROM Usuario WHERE correo_electronico_usuario = p_correo;
        
        IF contrasena_correcta = p_contrasena THEN
			SELECT 'Bienvenido de nuevo.' AS Mensaje;
		ELSE
			SELECT 'La contraseña es incorrecta.' AS Mensaje;
		END IF;
	ELSE
		SELECT 'El correo no se ha registrado.' AS Mensaje;
	END IF;
END //


CREATE PROCEDURE InsertarRobot(
    IN p_codigot VARCHAR(50),
    IN p_precio INT,
    IN p_descripcion VARCHAR(200)
)
BEGIN 
	DECLARE codigo_existente INT;
    SELECT COUNT(*) INTO codigo_existente FROM Robot WHERE codigo_tutorial = p_codigot;
    
    IF codigo_existente = 0 THEN
		INSERT INTO Robot (codigo_tutorial, precio_robot, descripcion_robot) VALUES (p_codigot, p_precio, p_descripcion);
        SELECT 'Robot registrado correctamente.' AS Mensaje;
	ELSE
		SELECT 'El robot ya está registrado.' AS Mensaje;
	END IF;
END //

CREATE PROCEDURE InsertarRobotCarrito(
    IN p_idUsuario VARCHAR(50),
    IN p_idRobot INT,
    IN p_cantidad VARCHAR(200)
)
BEGIN 
	DECLARE usuario_existente INT;
    DECLARE robot_existente INT;
    DECLARE cantidad_actual INT;
    DECLARE cantidad_total int;
    SELECT COUNT(*) INTO usuario_existente FROM RobotsEnCarrito WHERE id_usuario = p_idUsuario;
    
    IF usuario_existente != 0 THEN
		SELECT COUNT(*) INTO robot_existente FROM RobotsEnCarrito WHERE id_usuario = p_idUsuario and id_robot = p_idRobot;
		
        IF robot_existente = 1 THEN
			SELECT cantidad INTO cantidad_actual FROM RobotsEnCarrito WHERE id_usuario = p_idUsuario and id_robot = p_idRobot;
			SET cantidad_total = (p_cantidad + cantidad_actual);
            UPDATE RobotsEnCarrito SET cantidad = cantidad_total WHERE id_usuario = p_idUsuario and id_robot = p_idRobot;
			SELECT 'Incrementa la cantidad del Robot en el carrito del Usuario.' AS Mensaje;
		ELSE
			INSERT INTO RobotsEnCarrito (id_usuario, id_robot, cantidad) VALUES (p_idUsuario, p_idRobot, p_cantidad); 
			SELECT 'Agrega el Robot al carrito del Usuario.' AS Mensaje;
		END IF;
	ELSE
		INSERT INTO RobotsEnCarrito (id_usuario, id_robot, cantidad) VALUES (p_idUsuario, p_idRobot, p_cantidad); 
		SELECT 'Agrega el Robot creando el carrito del Usuario.' AS Mensaje;
	END IF;
END //

CREATE TRIGGER tras_cambio_usuario
AFTER UPDATE ON Usuario
FOR EACH ROW
BEGIN
	IF OLD.correo_electronico_usuario != NEW.correo_electronico_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'correo_electronico_usuario', OLD.correo_electronico_usuario, NEW.correo_electronico_usuario, NOW());
    END IF;
    IF OLD.user_name_usuario != NEW.user_name_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'user_name_usuario', OLD.user_name_usuario, NEW.user_name_usuario, NOW());
    END IF;
    IF OLD.nombre_usuario != NEW.nombre_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'nombre_usuario', OLD.nombre_usuario, NEW.nombre_usuario, NOW());
    END IF;
    IF OLD.apellido_usuario != NEW.apellido_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'apellido_usuario', OLD.apellido_usuario, NEW.apellido_usuario, NOW());
    END IF;
    IF OLD.edad_usuario != NEW.edad_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'edad_usuario', OLD.edad_usuario, NEW.edad_usuario, NOW());
    END IF;
    IF OLD.contrasena_usuario != NEW.contrasena_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'contrasena_usuario', OLD.contrasena_usuario, NEW.contrasena_usuario, NOW());
    END IF;
    IF OLD.telefono_usuario != NEW.telefono_usuario THEN
        INSERT INTO CambiosUsuario (id_usuario, tipo_dato_cambio, dato_anterior, dato_nuevo, fecha_de_cambio)
        VALUES (OLD.id_usuario, 'telefono_usuario', OLD.telefono_usuario, NEW.telefono_usuario, NOW());
    END IF;
END//

CREATE PROCEDURE EditarUsuario(
	IN p_idusuario VARCHAR(50),
	IN p_correo VARCHAR(50),
    IN p_user_name VARCHAR(50),
    IN p_nombre VARCHAR(50),
    In p_apellido VARCHAR(50),
    IN p_edad INT,
    IN p_contrasena VARCHAR(50),
    In p_telefono varchar(20)
)
BEGIN 
	DECLARE correo_existente INT;
    DECLARE correo_actual varchar(50);
    SELECT COUNT(*) INTO correo_existente FROM Usuario WHERE correo_electronico_usuario = p_correo;
    
    IF correo_existente = 0 THEN
		UPDATE Usuario SET correo_electronico_usuario = p_correo, user_name_usuario = p_user_name, nombre_usuario = p_nombre, apellido_usuario = p_apellido, edad_usuario = p_edad, contrasena_usuario = p_contrasena, telefono_usuario = p_telefono WHERE id_usuario = p_idusuario;
        SELECT 'Datos actualizados (nuevo correo).' AS Mensaje;
	ELSE
		SELECT correo_electronico_usuario INTO correo_actual FROM Usuario WHERE id_usuario = p_idusuario;
        IF correo_actual = p_correo THEN
			UPDATE Usuario SET correo_electronico_usuario = p_correo, user_name_usuario = p_user_name, nombre_usuario = p_nombre, apellido_usuario = p_apellido, edad_usuario = p_edad, contrasena_usuario = p_contrasena, telefono_usuario = p_telefono WHERE id_usuario = p_idusuario;
			SELECT 'Datos actualizados.' AS Mensaje;
		ELSE
			SELECT 'El correo ya está registrado por otro usuario.' AS Mensaje;
		END IF;
	END IF;
END //

CREATE PROCEDURE InsertarDireccionEnvio(
    IN p_nombre_envio VARCHAR(50),
    IN p_apellidos_envio VARCHAR(100),
    IN p_correo_electronico VARCHAR(100),
    IN p_pais VARCHAR(50),
    IN p_estado VARCHAR(50),
    IN p_calle VARCHAR(200),
    IN p_numero_interior VARCHAR(20),
    IN p_numero_exterior VARCHAR(20),
    IN p_colonia VARCHAR(200),
    IN p_codigo_postal INT,
    IN p_alcaldia_municipio VARCHAR(200),
    IN p_telefono_contacto VARCHAR(30)
)
BEGIN
    INSERT INTO DireccionEnvio (
        nombre_envio,
        apellidos_envio,
        correo_electronico,
        pais,
        estado,
        calle,
        numero_interior,
        numero_exterior,
        colonia,
        codigo_postal,
        alcaldia_municipio,
        telefono_contacto
    ) VALUES (
        p_nombre_envio,
        p_apellidos_envio,
        p_correo_electronico,
        p_pais,
        p_estado,
        p_calle,
        p_numero_interior,
        p_numero_exterior,
        p_colonia,
        p_codigo_postal,
        p_alcaldia_municipio,
        p_telefono_contacto
    );
    select "Envio registrado correctamente." as mensaje;
END//
DELIMITER ;

DELIMITER $$


CREATE PROCEDURE ValidarYAgregarAvance(
    IN p_id_usuario INT,
    IN p_id_tutorial INT,
    IN p_codigo_tutorial VARCHAR(20)
)
BEGIN
    DECLARE v_id_robot INT;

    -- Verificar si el código existe en la tabla Robot
    SELECT id_robot 
    INTO v_id_robot
    FROM Robot 
    WHERE codigo_tutorial = p_codigo_tutorial;

    -- Si el código no existe, enviar un mensaje indicando que no existe
    IF v_id_robot IS NULL THEN
        SELECT 'No_existe' AS mensaje;
    ELSE
        -- Verificar si algún usuario ya ha registrado un avance para el robot y tutorial con ese código
        IF EXISTS (
            SELECT 1 
            FROM AvanceTutorial 
            WHERE id_robot = v_id_robot AND id_tutorial = p_id_tutorial
        ) THEN
            -- Si ya existe un avance, no se realiza ninguna acción y se devuelve mensaje
            SELECT 'Utilizado' AS mensaje;
        ELSE
            -- Verificar si el usuario ya ha registrado el avance para ese robot y tutorial
            IF EXISTS (
                SELECT 1 
                FROM AvanceTutorial 
                WHERE id_usuario = p_id_usuario AND id_robot = v_id_robot AND id_tutorial = p_id_tutorial
            ) THEN
                -- Si el usuario ya tiene un avance, devolver mensaje
                SELECT 'Utilizado_Usuario' AS mensaje;
            ELSE
                -- Si no existe el avance, insertar el nuevo registro
                INSERT INTO AvanceTutorial (id_usuario, id_robot, id_tutorial, codigo_tutorial, avance_tutorial)
                VALUES (p_id_usuario, v_id_robot, p_id_tutorial, p_codigo_tutorial, 0);

                -- Devolver mensaje indicando que el avance fue agregado
                SELECT 'Exitoso' AS mensaje;
            END IF;
        END IF;
    END IF;
END;$$

DELIMITER ;





select *from Robot;

call validRUsuario("knsadkna", "jhasd");
call InsertarUsuario('ejemplo@correo.com', 'usuarioEjemplo','Diego', 'Contreras', 25, 'contrasena123', '5574765604');
call validRUsuario('ejemplo@correo.com', 'contrasena123');
select * from Usuario where correo_electronico_usuario = 'ejemplo@correo.com' and contrasena_usuario = 'contrasena123';
select *from DireccionEnvio;
select * from robot;
INSERT INTO Robot (codigo_tutorial, precio_robot, descripcion_robot) VALUES ('OTT-1234ABCD', 2500, 'Robot OTTOBOT educativo, ideal para aprender programación y robótica básica.');
INSERT INTO Tutorial (descripcion_tutorial, duracion_tutorial) 
VALUES ( 'Curso básico de programación para OTTOBOT, incluye conceptos de bucles y sensores.', 360);

INSERT INTO Tutorial (descripcion_tutorial, duracion_tutorial) 
VALUES ('Curso básico de programación para OTTOBOT, incluye conceptos de bucles y sensores.', 360);

CALL ValidarYAgregarAvance(1, 1, 'OTT-1234ABCD');
CALL ValidarYAgregarAvance(1, 1, 'NOT-EXISTENTE');