/*creacion de usuarios y de privilegiosa continuacion estan las estructuras

CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena';
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena';
GRANT [permiso] ON [nombre de bases de datos].[nombre de tabla] TO ‘[nombre de usuario]’@'localhost’;
REVOKE [permiso] ON [nombre de base de datos].[nombre de tabla] FROM ‘[nombre de usuario]’@‘localhost’;


lista de permisos
ALL PRIVILEGES: como mencionamos previamente esto permite a un usuario de MySQL acceder a todas las bases de datos asignadas en el sistema.
CREATE: permite crear nuevas tablas o bases de datos.
DROP: permite eliminar tablas o bases de datos.
DELETE: permite eliminar registros de tablas.
INSERT: permite insertar registros en tablas.
SELECT: permite leer registros en las tablas.
UPDATE: permite actualizar registros seleccionados en tablas.
GRANT OPTION: permite remover privilegios de usuarios.


Para probar el nuevo usaurio, debes cerrar sesión escribiendo quit y volviendo a iniciar sesión con éste comando en la consola:

mysql -u [nombre de usuario]-p

*/





create user 'rafa'@'localhost' identified by 'yolo'; -- sólo has craedo el usuario
GRANT ALL PRIVILEGES ON * . * TO 'rafa'@'localhost'; -- se le ha dado todos los privilegios al usuario




create user 'mike'@'localhost' identified by  'mimo';
GRANT ALL PRIVILEGES ON * . * TO 'mike'@'localhost';


-- sentencia para dar privilegios a cualquier usuario

GRANT ALL PRIVILEGES ON *.* TO 'rafa'@'localhost';
flush privileges;

-- MARCA ERROR PERO LA SENTENCIA PARA REMOVER LOS PRIVILEGIOS ESTA BIEN

REVOKE all privileges ON *.* FROM 'rafa'@'localhost';  -- Funciona pero debe ser ejecutado el script
flush privileges;

