


select p.Nombre, p.Apellido, f.Fecha_I from 
paciente p inner join estudio f on
p.idPaciente=f.Paciente_idPaciente
inner join 
parametros e1 on p.idPaciente=e1.Idparametros where glucosa >=70 and glucosa <=120;


select p.Nombre, p.Apellido, f.Fecha_I from 
paciente p inner join estudio f on
p.idPaciente=f.Paciente_idPaciente
inner join 
parametros e1 on p.idPaciente=e1.Idparametros where glucosa <=70 or glucosa >=120;

select p.Nombre, p.Apellido, f.Fecha_I from 
paciente p inner join estudio f on
p.idPaciente=f.Paciente_idPaciente
inner join 
parametros e1 on p.idPaciente=e1.Idparametros where trigliceridos >=60 and trigliceridos <=160;



select p.Nombre, p.Apellido, f.Fecha_I from 
paciente p inner join estudio f on
p.idPaciente=f.Paciente_idPaciente
inner join 
parametros e1 on p.idPaciente=e1.Idparametros where glucosa <=60 or glucosa >=160;


