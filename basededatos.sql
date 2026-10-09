/*
Estructura:
select qué quiero ver 
from de donde lo voy a sacar
where a que restricciones esta sujeto el resultado
*/


-- Quisiera mostrar cod_empleado, apellido, cargo y departamento de todos los empleados

select employee_id as "cod_empleado" , last_name as "Apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where (department_id = 90);

-- Version:
select employee_id as "cod_empleado" , last_name as "Apellido", job_title as "cargo", department_id as "departamento"
from oehr_employees
join oehr_jobs on oehr_employees.job_id = oehr_jobs.job_id;


-- Quisiera mostrar cod_empleado, apellido, crago, deartamento y fecha de contratacion de todos aquellos empleados que fueron contratados despues
-- del año 1995
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where (hire_date > '12-31-1995');

-- Quisiera mostrar cod_empleado, apellido, crago y departamento de la empleada whalen

-- Cuando no hay claridad, aosciado a si whalen es nombre o apellido debo generar una doble retriccion unidas con un operador logico en sql
-- se trabajan con sus expresones literales: and or not 

select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where (first_name= 'Whalen' or last_name = 'Whalen');


-- Quiera mostrar cod_empleado, apellido, cargo y departamento de todos aquellos empelados que ganen entre 3000 y 5000 usd
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento", salary
from oehr_employees
where (salary between 3000 and 5000);

-- Quisiera mostrar cod_empleado, apellido, cargo y departamento de todos aquellos empleados que no hayan sido contratados entre los años 95 y 96
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where (hire_date not between '01-01-1995' and '12-31-1996');   -- mm-dd-aaaa

-- Quisiera mostrar cod_empleado, apellido, cargo y departamento de todos aquellos empleados que trabajen en los departamentos 90, 100 y 50
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where(department_id= 90 or department_id=100 or department_id= 50);

-- El operardor in me permite trabajar en la restriccion de un campo, considerando un conjunto de valores. que se distribuye con el operador
-- lógico or de la siguiente forma
-- where campo_restringido(valores separados por coma)
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where department_id in(90,100,50);

-- Quisiera mostrar cod_empleado, apellido, cargo y departamento de todos aquellos empleados donde sus jefes no sean los que estan codificados
-- con los siguientes numeros: 100, 120, 114 y 121
select employee_id as "cod_empleado", last_name as "apellido", job_id as "cargo", department_id as "departamento"
from oehr_employees
where (manager_id not in(100,120,114,121)); 

-- Quisiera ver los datos de todos aquellos trabajadores en los que su apellido comience con la letra s o termine con la letra a 

-- Con métodos convencionales, no hay como resolverlo =)

-- Para resolveer el requerimiento anterior, es necesario trabajar con el operdor like, que trabaja de la siguiente forma:
-- Where campo_restringido like 'texto_definido'

-- Considerando que en 'texto definido', debo indicar un patrón de comportamiento con los comodines _ y %

-- El % se utiliza para decir "No me interesa lo que haya en una parte completa de la cadena"

-- El _ se utiliza para decir "No me interesa lo que haya en un caracter de la cadena"

-- Dado lo anterior, ¿cómo se resuelve el requerimiento anterior?
select *
from oehr_employees
where last_name like 'S%' or last_name like '%a';

-- Si la restricción fuera incluyente, bastaría sólo con una condición
select *
from oehr_employees
where last_name like 'S%'

-- Quisiera ver los datos de todos aquellos departamentosen los que su nombre tenga como segunda letra la A y termine con la letra S
select *
from oehr_departments
where deparment_name like '_a%s'

-- Quisiera ver cod, nombre y apellido concatenados de todos aquellos trabajadores donde su cargo tenga como penúltima letra la a
select employee_id, first_name || ' ' || last_name as "Nombre"
from oehr_employees
where job_id like '%A_';

-- Quisiera ver cod, nombre y apellido concatenados de todos aquellos trabajadores donde su apellido no tenga contenida la letra a
select employee_id, first_name || ' ' || last_name as "Nombre"
from oehr_employees
where last_name not like 'A%' and last_name not like '%a%';

-- Quisiera ver los datos de todos aquellos trabajadores que no estén sujetos a comisión
select *
from oehr_employees
where commission_pct is not null

-- Por último, si yo quisiera ordenar los datos, aparece una nueva cláusula definida como "order by" la cual va acompañada de uno o más campos
-- definidos en la cláusula select, de acuerdo al nivel de ordenamiento que requiera hacer, pudiendo utilizar alias de olumna y números,
-- de acuerdo a la posición del campo e la cláusula select

select Qué quiero ver
from de donde lo voy a sacar
where bajo que restricciones se ecneuntra el resultado
order by como voy a ordnar el resultado final

-- Quisiera mostrar cod_empleado, apellido, cargo, departamento y fecha de contratación de todos aquellos empleados que fueron contratados
-- después del año 1995, ordenado por apellido

select employee_id as "Codigo Empleado", last_name as "Apellido", job_id as "Cargo", department_id as "Departamento", hire_date as "Fecha de contratacion"
from oehr_employees
where hire_date >= '01-01-1996'
order by last_name;
-- or Apellido or 2

-- Quisiera mostrar cod_empleado, apellido, cargo, departamento y fecha de contratación de todos aquellos empleados que fueron contratados
-- después del año 1995, ordenado por fecha de contratación de manera descendente

select employee_id as "Codigo Empleado", last_name as "Apellido", job_id as "Cargo", department_id as "Departamento", hire_date as "Fecha de contratacion"
from oehr_employees
where hire_date >= '01-01-1996'
order by hire_date desc;

-- Quisiera mostrar cod_empleado, apellido, cargo, departamento y fecha de contratación de todos aquellos empleados que fueron contratados
-- después del año 1995, ordenado por fecha de contratación de manera descendente

select employee_id as "Codigo Empleado", last_name as "Apellido", job_id as "Cargo", department_id as "Departamento", hire_date as "Fecha de contratacion"
from oehr_employees
where hire_date >= '01-01-1996'
order by department_id, hire_date desc, last_name;

-- funcion_nombre [(arg1, arg2, ...)]
-- tipo carácter, numero, dato, general, conversion
-- carácter conversión (lower, upper, initcap)
-- lower('HoLa') = hola
-- carácter manipulación (concat, substr, length, instr, lpad | rpad, trim, replace)

--Clase 3

-- Quisiera ver cod_empleado, nombre y apellido concatenados, correo de todos los trabajadores, todo en mayúscula

select employee_id as "Codigo empleado", upper(first_name || ' ' || last_name) as "Nombre", upper(email) as "Correo"
from oehr_employees;

-- Quisiera ver cod_empleado, nombre y apellido concatenado, correo de todos los trabajadores, todo en minúscula

select employee_id as "Codigo empleado", lower(first_name || ' ' || last_name) as "Nombre", lower(email) as "Correo"
from oehr_employees;

-- Quisiera ver cod_empleado, nombre y apellido concatenado, correo de todos los trabajadores, con su primera letra en mayúscula

select employee_id as "Codigo empleado", initcap(first_name || ' ' || last_name) as "Nombre", initcap(email) as "Correo"
from oehr_employees;

-- Quisiera mostrar cod_empleado, apellido, cargo y departamento de la empleada WHALEN, considerando la restrición tal y como está escrita
-- en este requerimiento

select employee_id as "Codigo empleado", last_name as "Apellido", job_id as "Cargo", department_id as "Departamento"
from oehr_employees;
where upper(last_name) = 'WHALEN'

-- concat('Hello', 'World') = HelloWorld
-- substr('HelloWorld',1,5) = Hello
-- length('Helloworld') = 10
-- instr('HelloWorld', 'W') = 6
-- lpad(salary,10,'*') = *****24000
-- rpad(salary,10,'*') = 24000*****
-- replace('JACK and JUE', 'J', 'BL') = BLACK and BLUE
-- trim('H' from 'HelloWorld') = elloWorld

-- Quisiera ver cod_empleado, nombre y apellido concatenados, correo de todos los trabajadores, todo en mayúscula, utilizando la función concatenar

select employee_id as "Codigo empleado", upper(concat(first_name,concat(' ',last_name))) as "Nombre", upper(email) as "Correo"
from oehr_employees;

-- Quisiera que cortaran la penúltima letra de cada correo electrónico esto aplica para cada empleado y luegoo deben concatenarlo con @sql.cl

select concat(concat(substr(email,1,(length(email)-2)),substr(email,length(email),length(email))),'@sql.cl') as "Correo"
from oehr_employees;

-- Quisiera que montaran un correo electrónico para cada trabajador que mantenga el siguiente patrón: Primera letra del nombre concatenado con
-- el apellido y todo lo anterior concatenado con @sql.cl

select concat(concat(substr(first_name,1,1),last_name),'@sql.cl') as "Correo"
from oehr_employees;

-- Quisiera que probaran las funciones round, trunc y mod, sin embargo, no quiero que consulten una tabla, para ello en la cláusula from se debe incluir
-- la tabla virtual dual, para round probar 45.5674 mostrando 3, 2, 1 y 0 decimales, lo mismo para la función trunc, sin embargo para el mod, esto tiene
-- que trabajarse con la división de 54 entre 3

-- round(45.926,2) = 45.93
-- trunc(45.926,2) = 45.92
-- mod(1600,300) = 100

select round(45.5673,3),round(45.5673,2),round(45.5673,1),round(45.5673,0)
from dual

select trunc(45.5673,3),trunc(45.5673,2),trunc(45.5673,1),trunc(45.5673,0)
from dual

select mod(54,3)
from dual

-- Quiiera saber cuanto lleva trabajando cada empleado en semanas
-- De acuerdo a lo siguiente: Cod_Empleado, nombre concatenado con apellido, fecha_contrato, semanas_trabajadas
-- Siempre y cuando pertenezcan al departamento 50 u 80, ordenados del que menos ha trabajado al que más

-- Crear esta tabla con sus prefijos correspondientes a sus iniciales
create table gaef_ejemplo(
	rut varchar2(12)
);

-- La siguiente instrucción aplica correctamente ya que se ingresó como se solicita
insert into ejemplo (rut)
	values('13.572.343-2');

-- La siguiente instrucción no se puede convertir de forma implícita, ya que el número como número primero no existe
-- y luego no se puede hacer la resta correspondiente
insert into ejemplo (rut)
	values(13.572.343-2);

-- select employee_id as "Codigo Empleado", concat(first_name, concat(' ', last_name)) as "Nombre_Completo", hire_date as "Fecha_Contrato",
-- trunc(((sysdate - hire_date) / 7), 2) as "Semanas_Trabajadas"

select employee_id as "Codigo Empleado", first_name || ' ' || last_name as "Nombre_Completo", hire_date as "Fecha_Contrato",
trunc(((sysdate - hire_date) / 7), 2) as "Semanas_Trabajadas"
from oehr_employees
where department_id in (50, 80)
order by "Semanas_Trabajadas";

-- 21-08

-- to_number, to_char, to_date
-- Number <-> Char <-> Date

-- Quisiera transformar la fecha de hoy desde los números del formato por defecto a un texto que diga día mes año
-- (miércoles 21 de agosto de dos mil veinticuatro)

select to_char(sysdate,'day dd "de" month "de" year') as "Fecha"
from dual;

-- Quisiera ver los siguientes datos de los trabajadores: Cod_Empleado, nombre concatenado con su apellido, email concatenado con @bd.ucm.cl y su fecha de
-- contratación bajo el sigueinte formato: 31 de agosto de 2022

select employee_id as "Código empleado", first_name || ' ' || last_name as "Nombre completo", email || '@bd.ucm.cl' as "Email",
to_char(hire_date, 'dd "de" month "de" yyyy') as "Fecha de contratación"
from oehr_employees

-- Quisiera ver los siguientes datos de los trabajadores: Cod_Empleado, nombre concatenado con su apellido, email concatenado con @bd.ucm.cl y su sueldo bajo
-- el siguiente formato: $24,000.00

select employee_id as "Codigo empleado", first_name || ' ' || last_name as "Nombre completo", email || '@bd.ucm.cl' as "Email", to_char(salary, '$99,999.99')
from oehr_employees;

-- Quisiera que descomponga la fecha actual y sólo muestre el año

select to_char(sysdate,'yyyy') as "Año"
from dual;

-- Quisiera que el año identificado en el requerimiento anterior lo transforme en número

select to_number(to_char(sysdate, 'yyyy'), '9999') as "Año"
from dual;

-- Quisiera que lo trabajado en los requerimientos anteriores se utilice para resolver lo siguiente: quisiera ver el código, nombre y apellido, además de la fecha
-- de contratación de todos aquellos trabajadores que fueron contratados posterior al año 1995 (siendo esta restricción literal sólo incluyendo el año de la fecha),
-- y que sean ordenados por fecha de contratación de mayor a menor.

select employee_id as "Codigo empleado", first_name || ' ' || last_name as "Nombre completo", hire_date as "Fecha de contratación"
from oehr_employees
where to_number(to_char(hire_date, 'yyyy'), '9999') > 1995
order by hire_date desc;

-- Quisiera que lo trabajado en los requerimientos anteriores se utilice para resolver lo siguiente: quisiera ver el código, nombre y apellido, año de contratación
-- escrito de forma numérica y con cuatro dígitos de todos aquellos trabajadores que fueron contratados posterior al año 1995 (siendo esta restricción literal sólo
-- incluyendo el año de la fecha) y que sean ordenados por año de mayor a menor

select employee_id as "Codigo empleado", first_name || ' ' || last_name as "Nombre completo", to_char(hire_date, 'yyyy') as "Año de contratación"
from oehr_employees
where to_number(to_char(hire_date, 'yyyy'), '9999') > 1995
order by hire_date desc;

-- Quisiera un reporte construido de la siguiente forma: cod_trabajador, apellido, sueldo ($25,000.00), comisión asociada (mostrada con valores numéricos para
-- todos los trabajadores: 100.00%) y su comisión asociada en término de dólares ganados por concepto de comisión, para todos los trabajadores

select employee_id as "Codigo empleado", last_name as "Apellido", to_char(salary, '$99,999.99') as "Salario", to_char(nvl(commission_pct,0)*100, '999.99') || '%' as "Comisión", to_char(salary*commission_pct, '$99,999.99')
from oehr_employees
order by commission_pct

-- Tarea --

-- Quisiera un reporte construido de la siguiente forma: cod_trabajador, apellido, sueldo ($25,000.00), comisión asociada (mostrada con valores numéricos para
-- todos los trabajadores: 100) y en caso de que no tenga comisión, escriba el texto: 'sin comisión'

select employee_id as "Código Empleado", last_name as "Apellido", to_char(salary, '$99,999.99') as "Sueldo", nvl(to_char(commission_pct * 100, '999'),
	'Sin comisión') as  "Comisión asociada"
from oehr_employees;

-- Quisiera saber el promedio de los sueldos de todos los trabajadores
-- avg, count, max, min, stddev, sum, variance

select trunc(avg(salary), 3) as "Promedio Sueldos"
from oehr_employees;

-- Quisiera saber el promedio de los sueldos de los trabajadores del departamento 90

select trunc(avg(salary), 3) as "Promedio Sueldos"
from oehr_employees
where department_id = 90;

-- Quisiera saber la primera y última fecha de contratación de todos los empleados

select min(hire_date) as "Primera fecha de contratación", max(hire_date) as "Última fecha de contratación"
from oehr_employees;

-- Quisiera saber la cantidad de departamentos que poseen por lo menos un trabajador

select count(department_id) as "Departamento con por lo menos un trabajador"
from oehr_employees;

-- or 

select count(distinct department_id)
from oehr_employees;

-- Quisiera saber la cantidad de trabajadores que perciben rentas mayores a los 10k

select count(employee_id) as "Cantidad de trabajadores con renta mayor a 10k"
from oehr_employees
where salary > 10000;

-- Quisiera saber la diferencia de los sueldos máximo y mínimo

select max(salary) - min(salary) as "Diferencia de sueldo máximo y mínimo"
from oehr_employees;

-- Quisiera un reporte con el promedio de los sueldos de cada departamento, mostrando lo departamentos con su código asociado: cod_departamento, prom_sueldos

select department_id as "Código departamento", avg(salary) as "Prom_sueldos"
from oehr_employees;

-- No funciona porque en una columna tendrá muchos datos como resultado y en la otra sólo 1

-- Estructura de un select actualizada

select
from
where
group by
order by

-- Resolvamos el requerimiento anterior

select department_id as "Código departamento", avg(salary) as "Prom_sueldos"
from oehr_employees
group by department_id;

-- Y si quisieramos ordenar los sueldos promedio por departamento?

select department_id as "Código departamento", to_char(round(avg(salary), 0), '$999,999') as "Sueldo promedio"
from oehr_employees
group by department_id
order by 1;

-- Con la finalidad de generar presupuestos, quisiera montar un reporte que se encargue de saber cuál es el total acumulado de los sueldos por departamento y de acuerdo
-- a su cargo, ordenado por departamento: cod_departamento, cargo, sumatoria_sueldos, además del sueldo bajo el siguiente formato: $XXX,XXX.XX

select department_id as "Código departamento", job_id as "Cargo", to_char(sum(salary), '$999,999.99') as "Sumatoria sueldos"
from oehr_employees
group by department_id, job_id;

-- Quisiera un reporte donde se busque el sueldo máximo por departamento, siempre y cuando este sueldo máximo sea mayor que 10000

select department_id, max(salary)
from oehr_employees
where salary > 10000
group by department_id;

-- or

select department_id, max(salary)
from oehr_employees
group by department_id
having max(salary) > 10000;

-- Quisiera un reporte donde se busque el sueldo máximo por departamento, siempre y cuando este sueldo máximo sea mayor que 10000, y los departamentos estén en el
-- rango del 50 al 90, ordenado por departamento descendente.

select department_id, max(salary)
from oehr_employees
where department_id between 50 and 90
group by department_id
having max(salary) > 10000
order by department_id desc;

-- Quisiera un reporte que visualice el cod_trabajador, el nombre concatenado con el apellido, el nombre del cargo que tiene, además del nombre del departamento al que pertenece

select employee_id as "Código empleado", first_name || ' ' || last_name as "Nombre completo", job_title as "Cargo", department_name as "Departamento"
from oehr_employees e, oehr_jobs j, oehr_departments d
where e.department_id = d.department_id and e.job_id = j.job_id;

-- Quisiera un reporte que indique lo siguiente: cod_empleado, apellido_empleado, nombre_continente en el que vive

select employee_id as "Código empleado", last_name as "Apellido empleado", region_name as "Nombre continente"
from oehr_employees e, oehr_departments d, oehr_locations l, oehr_countries c, oehr_regions r
where e.department_id = d.department_id and
	  d.location_id = l.location_id and
	  l.country_id = c.country_id and
	  c.region_id = r.region_id

-- Usando Join

select employee_id as "Código empleado", first_name || ' ' || last_name as "Nombre completo", job_title as "Cargo", department_name as "Departamento"
from oehr_employees
inner join oehr_jobs on oehr_employees.job_id = oehr_jobs.job_id
inner join oehr_departments on oehr_employees.department_id = oehr_departments.department_id;

-- Quisiera veer el cod_empleado, concatenado el nombre con el apellido, y el nombre del departamento al que pertenece cada trabajador // con joins

select employee_id as "Código empleado", first_name || ' ' || last_name as "Nombre completo", department_name as "Departamento"
from oehr_employees
inner join oehr_departments on oehr_employees.department_id = oehr_departments.department_id;

-- or

select employee_id as "Código empleado", first_name || ' ' || last_name as "Nombre completo", department_name as "Departamento"
from oehr_employees
join oehr_departments using (department_id);

-- Quisiera ver el cod_empleado, concatenado el cod cargo con el apellido dee trabajador de la siguiente forma: castro es aca_ucm, además del nombre del cargo que tiene, entiéndase
-- que las barras son separadores visuales, no deben estar concatenadas.

-- 101 | Castro es aca_ucm | Académico

select employee_id as "Código empleado", last_name || ' es ' || job_id, job_title as "Cargo"
from oehr_employees
join oehr_jobs using (job_id);

-- Tarea
-- Quisiera saber del trabajador: nombre concatenado con el apellido, su codigo, el nombre de su departamento asociado y el nombre del
-- jefe asociado a dicho departamento además de la ciudad en la que se encuentra y además del nombre de su cargo.

select e.first_name || ' ' || e.last_name as "Nombre completo", e.employee_id as "Código empleado", department_name as "Departamento",
	e2.first_name || ' ' || e2.last_name as "Jefe Departamento", city as "Ciudad", job_title as "Cargo"
from oehr_employees e
join oehr_employees e2 on d.manager_id = e2.employee_id
join oehr_departments d using(department_id)
join oehr_locations l using(location_id)
join oehr_jobs j using(job_id);

-- v v v wip v v v

select e.first_name || ' ' || e.last_name as "Nombre completo", e.employee_id as "Código empleado", department_name as "Departamento",
	ei.first_name || ' ' || ei.last_name as "Jefe Departamento", city as "Ciudad", job_title as "Cargo"
from oehr_employees e
join oehr_employees ei on d.manager_id = ei.employee_id
join oehr_departments d on d.department_id = e.department_id
join oehr_locations l using(location_id)
join oehr_jobs j on j.job_id = e.job_id;

-- Quisiera saber datos acerca de los trabajadores que ganan más dinero que abel

select *
from oehr_employees
where salary > (select salary
				from oehr_employees
				where first_name = 'Abel' or last_name = 'Abel');

-- Quisiera saber cod_trabajador, apellido, nombre de departamento y ciudad de todos aquellos trabajadores que tengan un sueldo superior
-- al de whalen

select employee_id as "Código empleado", last_name as "Apellido", department_name as "Departamento", city as "Ciudad", salary
from oehr_employees
join oehr_departments d using(department_id)
join oehr_locations l using (location_id)
where salary > (select salary
				from oehr_employees
				where first_name = 'Whalen' or last_name = 'Whalen')
order by salary;

-- Quisiera saber cod_empleado, apellido, nombre departamento y ciudad de todos aquellos trabajadores que ganen sueldos que
-- varíen entre los sueldos de nayer y whalen



-- Quisiera saber el apellido, nombre_cargo y sueldo de todos aquellos trabajadores que tengan un cargo como el de taylor y
-- su sueldo sea mayor que el de taylor



-- 


select last_name || ', ' || first_name || ', nacido el ' || hire_date
from oehr_employees

select concat(last_name, concat(', ', concat(first_name, concat(', nacido el ', hire_date))))
from oehr_employees;



------ Unidad 2 ------

create table gaef_usuarios(
	cod_usuario number,
	nombre_usuario varchar2(25),
	apellido1_usuario varchar2(25),
	apellido2_usuario varchar2(25),
	constraint pk_gaef_usuario primary key(cod_usuario)
);

------
create or replace procedure nombre_procedimiento(
	parámetro que recibirá el procedimiento separado por comas
)
is
-- Si requiere variables locales, van acá, si no se obvía
begin
	cuerpo del procedimiento(acciones);
end;
------

-- Se solicita un procedimiento almacenado que se encargue de ingresar datos a la tabla usuario,
-- de nombre carga_usuarios

create or replace procedure gaef_carga_usuarios(
	cod_usuario_p number,
	nombre_usuario_p varchar2,
	apellido1_usuario_p varchar2,
	apellido2_usuario_p varchar2
)
is
begin
	insert into gaef_usuario(cod_usuario,nombre_usuario,apellido1_usuario,apellido2_usuario)
		values(cod_usuario_p,nombre_usuario_p,apellido1_usuario_p,apellido2_usuario_p);
end;


begin
	gaef_carga_usuarios(1,'Gustavo','Espinoza','Fuentes');
end;

-- Se solicita un procedimiento almacenado que se encargue de modificar el nombre y los apellidos
-- de los usuarios de acuerdo a su código, de nombre modifica_usuarios

create or replace procedure gaef_modifica_usuarios(
	cod_usuario_p number,
	nombre_usuario_p varchar2,
	apellido1_usuario_p varchar2,
	apellido2_usuario_p varchar2
)
is
begin
	update gaef_usuario set
		nombre_usuario = nombre_usuario_p
		apellido1_usuario = apellido1_usuario_p
		apellido2_usuario = apellido2_usuario_p
		where(cod_usuario = cod_usuario_p);
end;

begin
	gaef_carga_usuarios(1,'Gustavo','Espinoza','Fuentes');
end;

-- Se solicita un procedimiento almacenado que se encargue de eliminar usuarios de acuerdo a su código,
-- de nombre elimina_usuarios

create or replace procedure nombre_procedimiento(
	cod_usuario_p number
)
is
begin
	delete from gaef_usuario
		where(cod_usuario = cod_usuario_p);
end;

-- de acuerdo a lo solicitado por el requerimiento de la lámnia "clase 2"

-- Cada estudiante debe crear una secuencia, pensada en generar la clave primaria de tabla usuarios que hemos estado trabajando.

Create sequence gaef_pk_usuario
	start with 1
	increment by 1
	minvalue 1
	maxvalue 2500
	cache 20
	nocycle;

-- Se puede mezclar una secuencia con un procedimiento almacendo de insert?
-- Si

-- Cada usuario debe crear un procedimiento almacenado para la tabla xxx_usuario, el cual debe enargarse de insertar datos
-- en dicha tabla, considerando la creación de una secuencia, que se encargue de cargar la clave primaria de dicha tabla


create or replace procedure gaef_carga_usuarios(
	nombre_usuario_p varchar2,
	apellido1_usuario_p varchar2,
	apellido2_usuario_p varchar2
)
is
begin
	insert into gaef_usuario(nombre_usuario,apellido1_usuario,apellido2_usuario)
		values(gaef_pk_usuario.nextval,nombre_usuario_p,apellido1_usuario_p,apellido2_usuario_p);
end;


create or replace function gaef_obtener_sueldo(
	id_empleado number
)
return number
is
	sueldo number := 0;
begin
	if (id_empleado = 0) then
	return(-1);
	elsif (sueldo = 0) then
	return(0);
	end if;
	select salary into sueldo
	from oehr_employees
	where employee_id = id_empleado;
	return(sueldo);
end;

-- Para asignar valores de una consulta a una variable, esto debe trabajarse con un select into

select campo_a_consultar into variable
from tabla
...

select campo_a_consultar1, campo_a_consultar2, into variable1, variable2
from tabla
...



-- Se requiere modificar la tabla usuario a través de código con la instrucción alter table, agregando un campo nuevo
-- que será email de tipo varchar2 de largo 50. luego crear una función que se encargue de generar los correos electrónicos
-- de la siguiente forma: primera y segunda letra del nombre, tercera y cuarta letra del primer apellido, seguido de un punto
-- el segundo apellido completo y que termine en @testsql.com. modificar su procedimiento almacenado de carga de datos,
-- incorporando dentro de la carga de datos el correo, luego realizar un delete from a la tabla sin restricciones limpiarla y
-- luego un llamado al procedimiento almacenado para la carga de un registro donde se utilice la función.


alter table gaef_usuarios
	add email varchar2(50);

create or replace function gaef_genera_correos(
	nombre_f varchar2
	apellido1_f varchar2
	apellido2_f varchar2
)
return varchar2
is
	email_f varchar2(50) := ''
begin
	email_f := substr(nombre_f,1,2)||substr(apellido1_f,3,2)||'.'||apelllido2_f||'@testsql.cl'
	return email_f;
end;

































when ACCESS_INTO_NULL then RAISE_APPLICATION_ERROR(-6530,'El programa intentó asignar valores a los atributos de un objeto no inicializado.');
when CASE_NOT_FOUND then RAISE_APPLICATION_ERROR(-6592,'Ninguna de las opciones en las cláusulas WHEN de una declaración CASE está seleccionada y no hay ninguna cláusula ELSE.');
when COLLECTION_IS_NULL then RAISE_APPLICATION_ERROR(-6531,'El programa intentó aplicar métodos de recopilación distintos de EXISTS a una tabla o variedad anidada no inicializada, o el programa intentó asignar valores a los elementos de una tabla o variedad anidada no inicializada.');
when CURSOR_ALREADY_OPENED then RAISE_APPLICATION_ERROR(-6511,'El programa intentó abrir un cursor ya abierto.');
when DUP_VAL_ON_INDEX then RAISE_APPLICATION_ERROR(-1,'El programa intentó insertar valores duplicados en una columna que está restringida por un índice único.');
when INVALID_CURSOR then RAISE_APPLICATION_ERROR(-1001,'Hay una operación de cursor ilegal.');
when INVALID_NUMBER then RAISE_APPLICATION_ERROR(-1722,'code');
when NO_DATA_FOUND then RAISE_APPLICATION_ERROR(+100,'code');
when PROGRAM_ERROR then RAISE_APPLICATION_ERROR(-6501,'code');
when ROWTYPE_MISMATCH then RAISE_APPLICATION_ERROR(-6504,'code');
when STORAGE_ERROR then RAISE_APPLICATION_ERROR(-6500,'code');
when SUBSCRIPT_BEYOND_COUNT then RAISE_APPLICATION_ERROR(-6533,'code');
when SUBSCRIPT_OUTSIDE_LIMIT then RAISE_APPLICATION_ERROR(-6532,'code');
when SYS_INVALID_ROWID then RAISE_APPLICATION_ERROR(-1410,'code');
when TOO_MANY_ROWS then RAISE_APPLICATION_ERROR(-1422,'code');
when VALUE_ERROR then RAISE_APPLICATION_ERROR(-6502,'code');
when ZERO_DIVIDE then RAISE_APPLICATION_ERROR(-1476,'code');
when PROGRAM_ERROR then RAISE_APPLICATION_ERROR(num,'code');
when PROGRAM_ERROR then RAISE_APPLICATION_ERROR(num,'code');
when PROGRAM_ERROR then RAISE_APPLICATION_ERROR(num,'code');


