CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_estudiante`(in s_Id_estudiante varchar(15),
in s_Apellido_1 varchar(45), in s_Apellido_2 varchar(45), in s_Nombre_Completo varchar(45))
BEGIN
	insert into mydb.estudiante (Id_estudiante, Apellido_1, Apellido_2, Nombre_Completo)
	values ('s_Id_estudiante', 's_Apellido_1', 's_Apellido_2', 's_Nombre_Completo');
END